<head>
    <?php echo $this->Html->charset(); ?>
    <title>
        <?php echo $cakeDescription ?>:
        <?php echo $title_for_layout; ?>
    </title>
    <?php

    echo $this->Html->meta('icon');

    // jQuery CDN
    echo $this->Html->script('//code.jquery.com/jquery-1.10.2.min.js');

    // Twitter Bootstrap 3.0 CDN
    echo $this->Html->css('//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css');
    echo $this->Html->script('//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js');

    echo $this->fetch('meta');
    echo $this->fetch('css');
    echo $this->fetch('script');
    ?>
</head>