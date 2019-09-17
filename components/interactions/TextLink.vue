<template>
  <a v-if="url.startsWith('http')" :href="url" class="text-link">
    <slot></slot>
  </a>
  <n-link v-else :to="url" class="text-link">
    <slot></slot>
  </n-link>
</template>

<script>
export default {
  name: 'TextLink',
  props: {
    url: {
      type: String,
      required: true
    }
  }
}
</script>

<style lang="scss" scoped>
  @import '../../assets/scss/variables.scss';

  .text-link {
    font-weight: 500;
    font-size: 1.2rem;
    line-height: 140%;
    letter-spacing: 1.5px ;
    color: #72C9E0;
    cursor: pointer;
    display: inline-block;
    position: relative;

    @media screen and (max-width: $bp-tablet-sm) {
      font-size: 1rem;
    }

    &:after {
      position: absolute;
      display: block;
      height: 2px;
      width: 105%;
      border-radius: 1px;
      background-color: #DBEFF4;
      content: '';
      left: -5px;
      bottom: 0;
    }
  }
</style>
