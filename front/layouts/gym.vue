<template>
  <div>
    <div id="gym_v2_index">
      <div class="container-fluid">
        <h1>
          <router-link :to="{ name: 'gyms' }">
            GymDB
          </router-link>
        </h1>
        <Nuxt />
      </div>
    </div>
  </div>
</template>
