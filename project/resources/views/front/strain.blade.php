@extends('layouts.front')

@section('styles')
<style>
    .xzoom5 {
        height:240px;
        object-fit:cover;
    }

    .xzoom5 {
        width: 100%;
    }

    .xzoom-gallery5 {
        height:60px;
        object-fit:cover;
    }

    .order-tracking-content .track-form {
        margin-top: 0;
    }

    .read-more-btn {
        font-size: 12px;
        text-transform: uppercase;
        font-weight: 400;
        color: #fff;
        background: #84a45a;
        padding: 7px 20px;
        border: 1px solid #84a45a;
        border-radius: 50px;
        -webkit-transition: 0.3s ease-in;
        -moz-transition: 0.3s ease-in;
        -o-transition: 0.3s ease-in;
        transition: 0.3s ease-in;
    }

    .read-more-btn:hover {
        background: none;
        color: #84a45a;
    }

    .action-area {
        margin: 20px 0;
    }

</style>
@endsection

@section('content')
    <!-- Breadcrumb Area Start -->
    <div class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="pages">
                        <li>
                            <a href="{{ route('front.index') }}">
                                {{ $langg->lang17 }}
                            </a>
                        </li>
                        <li>
                            <a href="{{ route('front.strain') }}">
                                Strain
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Area End -->

    <!-- Blog Page Area Start -->
    <section class="product-details-page">
        <div class="container">
            <div class="order-tracking-content">
                @include('includes.admin.form-success-session')
                <form class="track-form" id="search-form" action="{{ route('front.strainsearch') }}">
                    <input type="text" name="search" id="search" placeholder="Enter Search Key Word" value="{{ $search? $search: '' }}">
                    @if(!Auth::guard('web')->check())
                        <a class="mybtn1" href="{{ route('user.login') }}">Add New Strain</a>
                    @else
                        <a class="mybtn1" href="{{route('front.strainadd')}}">Add New Strain</a>
                    @endif
                </form>
            </div>
            <div id="ajaxContent">
                <div class="row">
                    @foreach($strains as $strain)
                        <div class="col-md-6 col-sm-12 mb-2">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="xzoom-container">
                                        <img class="xzoom5" src="{{ $strain->main_thumb()? asset($strain->main_thumb()->path):asset('assets/images/noimage.png') }}"/>
                                        <div class="xzoom-thumbs">
                                            <div class="all-slider">
                                                @forelse($strain->galleries as $gal)
                                                    <a href="javascript:void(0)" data-href="{{asset($gal->path)}}" class="img-link-item">
                                                        <img class="xzoom-gallery5" width="80" src="{{asset($gal->path)}}">
                                                    </a>
                                                @empty
                                                    <a href="javascript:void(0)" data-href="{{asset('assets/images/noimage.png')}}" class="img-link-item">
                                                        <img class="xzoom-gallery5" width="80" src="{{asset('assets/images/noimage.png')}}">
                                                    </a>
                                                @endforelse
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div class="action-area">
                                        @if(!Auth::guard('web')->check())
                                            <a class="read-more-btn" href="{{ route('user.login') }}">Edit Strain Info</a>
                                        @else
                                            <a class="read-more-btn" href="{{route('front.strainshow',$strain->id)}}">Edit Strain Info</a>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="right-area">
                                        <div class="product-info">
                                            <h4 class="product-name">{{ $strain->name }}</h4>
                                            <p>{{ $strain->effect }}</p>
                                            <p>{{ $strain->description }}</p>
                                            <p>{{ $strain->parent }}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
                <div class="page-center">
                    {!! $strains->links() !!}
                </div>
            </div>

        </div>
    </section>
    <!-- Blog Page Area Start -->




@endsection


@section('scripts')

    <script type="text/javascript">


        // Pagination Starts

        $(document).on('click', '.pagination li', function (event) {
            event.preventDefault();
            if ($(this).find('a').attr('href') != '#' && $(this).find('a').attr('href')) {
                $('#preloader').show();
                $('#ajaxContent').load($(this).find('a').attr('href'), function (response, status, xhr) {
                    if (status == "success") {
                        $("html,body").animate({
                            scrollTop: 0
                        }, 1);
                        $('#preloader').fadeOut();
                    }

                });
            }
        });

        $("#search").on('change', function() {
            $("#search-form").submit();
        })

        $(document).on('click', ".img-link-item", function() {
            var href=$(this).data('href');
            var attach_obj = $(this).parents('.xzoom-container').find('.xzoom5');
            console.log(href);
            $(attach_obj).attr('src', href);
        })
        // Pagination Ends

    </script>


@endsection