<template>
  <a v-if="url.startsWith('http')" :href="url" :class="['btn', size, center ? 'center' : '']" @click="onClick">
    <slot></slot>
  </a>
  <n-link v-else :to="url" :class="['btn', size, center ? 'center' : '']" @click="onClick">
    <slot></slot>
  </n-link>
</template>

<script>
export default {
  name: 'Button',
  props: {
    onClick: {
      type: Function,
      required: true,
    },
    size: {
      type: String,
      required: false,
      default: 'm'
    },
    center: {
      type: Boolean,
      default: false
    },
    url: {
      type: String,
      default: '#'
    }
  },
  mounted() {
    console.log('button mounted is center?', this.center)
  }
}
</script>

<style lang="scss" scoped>
  .btn {
    font-family: Roboto, sans-serif;
    color: #fff;
    background: #72c9e0;
    box-shadow: 0 0 32px rgba(181, 187, 201, 0.4);
    border-radius: 4px;
    border: 0;
    transition: 200ms;

    &.s {
      padding: 8px;
      font-size: .6rem;
    }

    &.m {
      padding: 8px 12px;
      font-size: .8rem;
    }

    &.l {
      padding: 12px 24px;
      font-size: 1rem;
    }

    &.center {
      margin-left: auto;
      margin-right: auto;
    }

    &:hover {
      -webkit-box-shadow: 0 0 32px rgba(181, 187, 201, 0.8);
      -moz-box-shadow: 0 0 32px rgba(181, 187, 201, 0.8);
      box-shadow: 0 0 32px rgba(181, 187, 201, 0.8);
    }
  }
</style>
