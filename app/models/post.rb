class Post < ActiveRecord::Base

  validates :slug, presence: true, uniqueness: true
  validates :title, presence: true

  acts_as_url :title, url_attribute: :slug

  scope :unpublished, -> { where(draft: true) }
  scope :published, -> { where(draft: false) }
  scope :newest, -> { order("published_at desc") }
  scope :oldest, -> { order("published_at asc") }
  scope :previous, lambda { |post| where("published_at < ?", post.published_at).newest }
  scope :next, lambda { |post| where("published_at > ?", post.published_at).newest }
  scope :ambiguous_slug, lambda { |slug| slug.to_i.to_s == slug ? where(id: slug) : where(slug: slug) }

  before_save :update_published_at, :chronic_parse_date

  def self.from_slug(slug)
    self.ambiguous_slug(slug).first
  end

  def to_param
    slug
  end

  def external?
    !url.blank?
  end

# def published_at
#   # read_attribute(:published_at) ? read_attribute(:published_at).to_formatted_s(:long) : ""
# end

private

  def chronic_parse_date
    if published_at && self.published_at_changed?
      self.published_at = Chronic.parse(published_at) if published_at.is_a? String
    end
  end

  def update_published_at
    if published_at.nil? && draft == false
      self.published_at = Time.now
    end
  end

  def draft_changed_to_false
    self.draft_changed? && self.draft_was == true
  end

end
