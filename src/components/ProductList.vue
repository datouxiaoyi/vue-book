<template>
    <div class="container">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>图片</th>
                    <th>名称</th>
                    <th>价格</th>
                    <th>购买</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="product in products" :key="product.id">
                    <td>{{ product.id }}</td>
                    <td><img :src="product.image" :alt="'Product ' + product.id" /></td>
                    <td>{{ product.name }}</td>
                    <td>${{ product.price.toFixed(2) }}</td>
                    <td><button class="buy-button" @click="buyProduct(product)">购买</button></td>
                </tr>
            </tbody>
        </table>
    </div>
</template>


<script>
import c from '../assets/c++.png';
import Csharp from '../assets/Csharp.png';
import golang from '../assets/golang.png';
import java from '../assets/java.png';
import python from '../assets/python.png';
export default {
    data() {
        return {
            products: [
                { id: 1, name: 'Python', price: 10.00, image: python },
                { id: 2, name: 'C++', price: 20.00, image: c },
                { id: 3, name: 'C#', price: 30.00, image: Csharp },
                { id: 4, name: 'Java', price: 40.00, image: java },
                { id: 5, name: 'Go', price: 50.00, image: golang }
            ]
        };
    },
    methods: {
        async buyProduct(product) {
            const formData = new FormData();
            formData.append('id', product.id);
            formData.append('title', product.name);
            formData.append('price', product.price);

            try {
                const response = await fetch('http://127.0.0.1:8888/create', {
                    method: 'POST',
                    body: formData
                });
                const data = await response.json();
                if (data.status === 1) {
                    alert('购买成功');
                    window.location.href = data.url;
                } else {
                    alert('购买失败');
                }
            } catch (error) {
                console.error('Error:', error);
                alert('购买过程中发生错误');
            }
        }
    }
};
</script>

<style scoped>
/* 确保整个页面覆盖全屏 */
html,
body {
    margin: 0;
    padding: 0;
    width: 100%;
    height: 100%;
}

/* 确保 container 元素适应浏览器大小 */
.container {
    width: 100%;
    height: 100%;
    overflow: auto;
    /* 添加滚动条以适应内容溢出 */
}

/* 确保 table 元素适应容器 */
table {
    width: 100%;
    border-collapse: collapse;
    table-layout: auto;
    /* 让表格根据内容自动调整列宽 */
}

th,
td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center;
}

th {
    background-color: #f2f2f2;
}

img {
    max-width: 100px;
    max-height: 100px;
    width: auto;
    /* 使图片宽度自适应 */
    height: auto;
    /* 使图片高度自适应 */
}

.buy-button {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    border: none;
    border-radius: 4px;
}
</style>