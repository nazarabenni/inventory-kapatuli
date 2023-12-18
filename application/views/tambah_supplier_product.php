<div class="container-fluid">
    <form action="<?= base_url('supplier_product/tambah_aksi') ?>" method="POST">
        <div class="form-group">
            <label>Name Product</label>
            <input type="text" name="name_product" class="form-control">
            <?= form_error('name_product', '<div class="text-small text-danger">', '</div>'); ?>
        </div>
        <div class="form-group">
            <label>Stock Product</label>
            <input type="text" name="stock_product" class="form-control">
            <?= form_error('stock_product', '<div class="text-small text-danger">', '</div>'); ?>
        </div>
        <div class="form-group">
            <label>Supplier</label>
            <select class="form-control" name="supplier_id" aria-label="Default select example">
                <option selected>Select</option>
                <?php foreach ($supplier as $sp): ?>
                    <option value="<?= $sp->id ?>"><?= $sp->name ?></option>
                <?php endforeach; ?>
            </select>
            <?= form_error('supplier_id', '<div class="text-small text-danger">', '</div>'); ?>
        </div>
        <div class="form-group">
            <label>Date Expired</label>
            <input type="date" name="expired_date" class="form-control">
            <?= form_error('expired_date', '<div class="text-small text-danger">', '</div>'); ?>
        </div>
        <div class="form-group">
            <label>Date Received</label>
            <input type="date" name="date_received" class="form-control">
            <?= form_error('date_received', '<div class="text-small text-danger">', '</div>'); ?>
        </div>

        <button type="submit" class="btn btn-primary btn-sm"><i class="fas fa-save"></i> Simpan</button>
        <button type="reset" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i> reset</button>
    </form>
</div>