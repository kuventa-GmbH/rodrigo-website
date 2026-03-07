#!/usr/bin/env ruby
# frozen_string_literal: true

require "fileutils"

module GallerySync
  module_function

  SOURCE_ROOT = File.expand_path("../assets/img/photos/galerie", __dir__)
  TARGET_ROOT = File.expand_path("../assets/img/galerie", __dir__)

  DIRECTORY_RENAMES = {
    "Plasterweg" => "pflasterweg"
  }.freeze

  def call
    move_gallery_root
    normalize_project_directories
    rename_project_images
  end

  def move_gallery_root
    return if Dir.exist?(TARGET_ROOT)
    return unless Dir.exist?(SOURCE_ROOT)

    FileUtils.mkdir_p(File.dirname(TARGET_ROOT))
    FileUtils.mv(SOURCE_ROOT, TARGET_ROOT)
  end

  def normalize_project_directories
    project_dirs.each do |dir|
      basename = File.basename(dir)
      normalized = DIRECTORY_RENAMES.fetch(basename, slugify(basename))
      next if basename == normalized

      target = File.join(File.dirname(dir), normalized)
      temp = File.join(File.dirname(dir), "__gallery_dir_tmp__#{normalized}")
      FileUtils.mv(dir, temp)
      FileUtils.mv(temp, target)
    end
  end

  def rename_project_images
    project_dirs.each do |dir|
      slug = File.basename(dir)
      images = Dir.children(dir)
        .reject { |name| name.start_with?(".") }
        .map { |name| File.join(dir, name) }
        .select { |path| File.file?(path) }
        .sort

      images.each do |path|
        FileUtils.rm_f(path) if File.basename(path).downcase == ".ds_store"
      end

      images = images.reject { |path| File.basename(path).start_with?(".") }

      temp_paths = []
      images.each_with_index do |path, index|
        ext = File.extname(path).downcase
        temp = File.join(dir, "__gallery_tmp__#{index + 1}#{ext}")
        FileUtils.mv(path, temp) unless path == temp
        temp_paths << temp
      end

      temp_paths.each_with_index do |path, index|
        ext = File.extname(path).downcase
        target = File.join(dir, format("%s-%02d%s", slug, index + 1, ext))
        FileUtils.mv(path, target)
      end
    end
  end

  def project_dirs
    Dir.glob(File.join(TARGET_ROOT, "*")).select { |path| File.directory?(path) }.sort
  end

  def slugify(value)
    value
      .to_s
      .strip
      .gsub("Ä", "Ae")
      .gsub("Ö", "Oe")
      .gsub("Ü", "Ue")
      .gsub("ä", "ae")
      .gsub("ö", "oe")
      .gsub("ü", "ue")
      .gsub("ß", "ss")
      .gsub(/[^a-zA-Z0-9]+/, "-")
      .gsub(/^-+|-+$/, "")
      .downcase
  end
end

GallerySync.call
