<template>
  <div class="activiteiten">
    <div class="container">
      <h1>Activiteiten</h1>
      <full-calendar />
    </div>
  </div>
</template>

<script>

export default {
  components: {
  },
  data: () => ({

  }),
  head() {
    return {
      title: 'Activiteiten'
    }
  }
}
</script>

<style lang="scss" scoped>
.activiteiten {
  padding: 0 0 64px 0;
}
</style>
