<script setup>
import ProductList from './components/ProductList.vue';
</script>

<template>
  <main class="main-container">
    <ProductList />
  </main>
</template>

<style scoped>
/* 确保 main 元素覆盖全屏 */
.main-container {
  width: 80vw;
  /* 视口宽度的 100% */
  height: 100vh;
  /* 视口高度的 100% */
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
