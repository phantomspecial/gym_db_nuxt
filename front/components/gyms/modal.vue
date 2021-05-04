<template>
  <div class="modal show" tabindex="-1" style="display: block;" @click.self="$emit('close')">
    <div class="modal-dialog modal-lg" role="document" style="z-index: 1500;">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">
            {{ gymDetail.master_gym_name }}
            <br>
            {{ gymDetail.shop_name }}
          </h5>
          <button type="button" class="close" aria-label="Close">
            <span aria-hidden="true" @click.self="$emit('close')">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <table class="table table-bordered table-hover table-sm">
            <tbody>
              <tr>
                <th>ジム情報ID</th>
                <td>
                  <nuxt-link :to="{ name: 'gyms-id', params: { id: gymDetail.id } }">
                    {{ gymDetail.id }}
                  </nuxt-link>
                </td>
              </tr>
              <tr>
                <th>ジム名</th>
                <td>{{ gymDetail.master_gym_name }}</td>
              </tr>
              <tr>
                <th>都道府県</th>
                <td>{{ gymDetail.master_pref_name }}</td>
              </tr>
              <tr>
                <th>店舗名</th>
                <td>{{ gymDetail.shop_name }}</td>
              </tr>
              <tr>
                <th>郵便番号</th>
                <td>{{ gymDetail.post_address }}</td>
              </tr>
              <tr>
                <th>電話番号</th>
                <td>{{ gymDetail.tel_no }}</td>
              </tr>
              <tr>
                <th>住所</th>
                <td>{{ gymDetail.address }}</td>
              </tr>
              <tr>
                <th>アクセス</th>
                <td>{{ gymDetail.access }}</td>
              </tr>
              <tr>
                <th>営業日・休館日</th>
                <td>{{ gymDetail.opening_hours }}</td>
              </tr>
              <tr>
                <th>駐車場・駐輪場</th>
                <td>{{ gymDetail.parking }}</td>
              </tr>
              <tr>
                <th>ジム設備</th>
                <td>{{ gymDetail.facility }}</td>
              </tr>
              <tr>
                <th>その他情報1</th>
                <td>{{ gymDetail.other_info1 }}</td>
              </tr>
              <tr>
                <th>URL</th>
                <td><a :href="gymDetail.url" target="_blank">{{ gymDetail.url }}</a></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div class="modal-backdrop fade show" @click.self="$emit('close')" />
  </div>
</template>

<script>
export default {
  props: {
    gymDetail: {
      type: Object,
      required: true
    }
  }
}
</script>

<style scoped lang="scss">
.modal {
  display: block;
}
.modal-dialog {
  z-index: 1500;
}
</style>
