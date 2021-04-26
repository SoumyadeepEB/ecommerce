<?php 
    session_start();
    include "config.php";
    $page = isset($_GET['page']) ? mysqli_real_escape_string($link,$_GET['page']) : 1;
    $limit = 10;
    $offset = ($page - 1) * $limit;
    $fsql = "SELECT * FROM category LIMIT $limit OFFSET $offset";
    $fquery = mysqli_query($link,$fsql);

    if(isset($_POST['category_add'])){
        $category = $_POST['category'];
        $check_sql = "SELECT * FROM category WHERE name='$category'";
        $check_query = mysqli_query($link,$check_sql);

        if(mysqli_num_rows($check_query) == 0){
            $sql = "INSERT INTO category (name,status) VALUES ('$category',0)";
            $query = mysqli_query($link,$sql);
            if($query){
                $_SESSION['success'] = 'One category added successfully';
                header('location:categorylist.php');
            }else{
                $_SESSION['error'] = 'Category not added';
                header('location:categorylist.php');
            }
        }else{
            $_SESSION['cat_error'] = 'Category name already exist';
        }
    }
    $total_page = isset($total_page) ? $total_page : 0;
?>
<head>
    <?php include 'layouts/head.php' ?>
    <title>Category List</title>
</head>
<body>
    <?php include 'layouts/header.php' ?>
    <div class="container">
        <img src="assets/images/loader.gif" id="loader" width="100px" style="position:absolute;top:50%;left:50%;z-index:1;display:none">
        <?php if($_SESSION['type'] == 1){ ?>
            <h1>Category List</h1>
            <button type="button" class="btn btn-success mt-3 mb-3" data-toggle="modal" data-target="#myModal">Add Category</button>

            <?php if(isset($_SESSION['success'])){ ?>
                <div class="alert alert-success"><?= $_SESSION['success']; unset($_SESSION['success']); ?></div>
            <?php } ?>
            <?php if(isset($_SESSION['error'])){ ?>
                <div class="alert alert-danger"><?= $_SESSION['error']; unset($_SESSION['error']); ?></div>
            <?php } ?>

            <div class="modal animate-top" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Add New Category</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form action="" method="POST">
                            <div class="row">
                                <div class="col-sm-12">
                                    <strong>Category Name</strong>
                                    <input type="text" name="category" id="category" class="form-control" placeholder="Category name" value="<?= isset($_POST['category']) ? $_POST['category'] : '' ?>" required>
                                    <?php if(isset($_SESSION['cat_error'])){ ?><span class="text-danger"><?= $_SESSION['cat_error']; unset($_SESSION['cat_error']); ?></span><?php } ?>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" name="category_add" class="btn btn-primary">Submit</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>

            <table class="table table-bordered table-striped table-hover">
            <thead class="bg-dark text-center text-white">
                <tr>
                    <th class="align-middle">Category Id</th>
                    <th class="align-middle">Category Name</th>
                    <th class="align-middle">Status</th>
                    <th class="align-middle">Action</th>
                </tr>
            </thead>
            <tbody class="text-center">
                <?php if(mysqli_num_rows($fquery) == 0){ ?>
                    <tr><td colspan="4" class="text-center">No record found</td></tr>
                <?php }else{ ?>
                <?php 
                    $psql = "SELECT * FROM category";
                    $pquery = mysqli_query($link,$psql);
                    $total_record = mysqli_num_rows($pquery);
                    $total_page = ceil($total_record / $limit);
                    while($category = mysqli_fetch_assoc($fquery)){ 
                ?>
                <tr>
                    <td><?= $category['id'] ?></td>
                    <td><?= $category['name'] ?></td>
                    <td>
                        <label class="switch">
                            <input type="checkbox" name="status" class="category_status" <?= $category['status'] == 1 ? 'checked' : '' ?> value="<?= $category['status'] ?>" data-cid=<?= $category['id'] ?>>
                            <span class="slider round"></span>
                        </label>
                    </td>
                    <td>
                        <a href="update.php?id=<?= $category['id'] ?>" class="text-dark"><i class='fas fa-edit'></i></a>
                        <a href="delete.php?id=<?= $category['id'] ?>" class="text-dark"><i class='fas fa-trash'></i></a>
                    </td>
                </tr>
                <?php }} ?>
            </tbody>
            </table>
            <br>
            <ul class="pagination">
                <li class="page-item <?= ($page > 1) ? '' : 'disabled' ?>"><a class="page-link" href="categorylist.php?page=<?= $page-1 ?>">Previous</a></li>
            <?php for($i=1;$i<=$total_page;$i++){ ?>
                <li class="page-item <?= ($page == $i) ? 'active' : '' ?>"><a class="page-link" href="categorylist.php?page=<?= $i ?>"><?php echo $i ?></a></li>
            <?php } ?>
                <li class="page-item <?= ($total_page > $page) ? '' : 'disabled' ?>"><a class="page-link" href="categorylist.php?page=<?= $page+1 ?>">Next</a></li>
            </ul>
        <?php }else{ echo '<script>window.location.href="index.php"</script>'; } ?>
    </div>
    <?php include 'layouts/footer.php' ?>
</body>