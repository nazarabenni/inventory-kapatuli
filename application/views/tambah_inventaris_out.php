<div class="container-fluid">
    <form action="<?= base_url('inventaris_pendataan_out/tambah_aksi') ?>" method="POST">
        <div class="form-group">
            <label>Product ID</label>
            <select class="form-control" name="product_id" aria-label="Default select example">
                <option selected>Select</option>
                <?php foreach ($products as $product): ?>
                    <option value="<?= $product->id ?>"><?= $product->name ?></option>
                <?php endforeach; ?>
            </select>
            <?= form_error('product_id', '<div class="text-small text-danger">', '</div>'); ?>
        </div>
        <div class="form-group">
            <label>Merchant ID</label>
            <select class="form-control" name="merchant_id" aria-label="Default select example">
                <option selected>Select</option>
                <?php foreach ($merchants as $merchant): ?>
                    <option value="<?= $merchant->id ?>"><?= $merchant->name ?></option>
                <?php endforeach; ?>
            </select>
            <?= form_error('merchant_id', '<div class="text-small text-danger">', '</div>'); ?>
        </div>
        <div class="form-group">
            <label>User ID</label>
            <select class="form-control" name="user_id" aria-label="Default select example">
                <option selected>Select</option>
                <?php foreach ($list_users as $user): ?>
                    <option value="<?= $user->id ?>"><?= $user->name ?></option>
                <?php endforeach; ?>
            </select>
            <?= form_error('user_id', '<div class="text-small text-danger">', '</div>'); ?>
        </div>
        <div class="form-group">
            <label>Date Delivery</label>
            <input type="date" name="date_delivery" class="form-control">
            <?= form_error('date_received', '<div class="text-small text-danger">', '</div>'); ?>
        </div>
        <div class="form-group">
            <label>Amount Delivered</label>
            <input type="text" name="amount_delivered" class="form-control">
            <?= form_error('amount_delivered', '<div class="text-small text-danger">', '</div>'); ?>
        </div>

        <button type="submit" class="btn btn-primary btn-sm"><i class="fas fa-save"></i> Simpan</button>
        <button type="reset" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i> reset</button>
    </form>
</div>