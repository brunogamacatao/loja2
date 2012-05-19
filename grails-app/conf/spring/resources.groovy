// Place your Spring DSL code here
beans = {
  thumbnailEditorRegistrar(ThumbnailEditorRegistrar) {
    thumbnailService = ref("thumbnailService")
  }
}
