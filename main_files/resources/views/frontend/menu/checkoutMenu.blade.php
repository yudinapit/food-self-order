@extends('frontend.menu.layout')
@section('content')
@section('navbar')
<a href="{{ route('listMenu', $code_table) }}">
    <img src="{{ asset('assets/img/arrow-left.svg') }}" alt="">
</a>
<div class="font-size-18 font-weight-600 mx-auto">
    Review My Order
</div>
@endsection
@push('css')
<style>
    #app .app {
        background: #E1E1E1 !important;
    }
</style>
@endpush
<div class="py-5" id="listMenu">
    <div class="row g-sm-4 g-3 py-3">
        @foreach ($data as $item)
        <div class="col-12" id="menuSelect-{{ $item->id }}">
            <div class="card radius-10 rounded-10 menu-item" data-id="{{ $item->id }}" data-qty="{{ $item->qty }}" style="cursor: pointer; border: 1px solid #ECECEC">
                <div class="card-body">
                    <div class="vstack justify-content-between gap-3 item-menu-bottom">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="font-size-16 font-weight-500" style="color: #323232">{{ $item->title }}</div>
                            <div>
                                <button class="btn btn-secondary rounded-10 font-sizze-10 font-weight-700 border-0 px-3" style="background: #EFEFEF; color: #363B45">
                                    Edit
                                </button>
                            </div>
                        </div>
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="font-size-16 font-weight-700" style="color: #848484">
                                Rp {{ number_format($item->price ) }}
                            </div>
                            <div class="font-weight-700 font-size-16">
                                x
                                <span class="qty-selected" data-id="{{ $item->id }}" id="qty-selected-{{ $item->id }}">
                                    {{ $item->qty }}
                                </span>
                            </div>
                       </div>
                    </div>
                </div>
            </div>
        </div>
        @endforeach
    </div>
</div>
<div class="fixed-bottom d-flex justify-content-center">
    <div class="bg-body border-top border-grey" style="width: 100%; max-width: 600px">
        <div class="p-4 vstack gap-2">
            <div class="d-flex align-items-center justify-content-between">
                <div>
                    Items
                </div>
                <h6>
                    <b class="qty-item">{{ $totalQty }}</b>
                </h6>
            </div>
            <div class="border-top border-grey"></div>
            <div class="d-flex align-items-center justify-content-between">
                <div>
                    Total
                </div>
                <h6>
                    <b class="price-total">Rp {{ number_format($totalPrice, 0, ',', '.')}}</b>
                </h6>
            </div>
            <button class="btn btn-secondary text-nowrap px-5 w-100 py-2 font-weight-700 radius-10 rounded-10 border-0 mt-3 done-menu" style="background: #513819">
                Proceed to checkout
            </button>
        </div>
    </div>
</div>

@push('modals')
<div class="modal" id="modalDetailMenu" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content border-0" style="border-radius: 20px">
        <div class="modal-body p-4">
          <div class="font-size-18">
            Change <span class="font-weight-700 name-menu-detail">lorem ipsum</span>
          </div>
          <div class="py-5">
            <div class="row align-items-center justify-content-center">
                <div class="col-2">
                    <div class="d-flex align-items-center rounded-circle justify-content-center min-qty-detail" style="background: #513819; height: 40px; width: 40px; cursor: pointer">
                        <i class="fas fa-minus" style="color: white"></i>
                    </div>
                </div>
                <div class="col-8">
                    <input class="form-control border-0 border-bottom qty-menu-input text-center py-4" value="1" style="border-radius: 0px; font-size: 30px"/>
                </div>
                <div class="col-2">
                    <div class="d-flex align-items-center rounded-circle justify-content-center add-qty-detail" style="background: #513819; height: 40px; width: 40px; cursor: pointer">
                        <i class="fas fa-plus" style="color: white"></i>
                    </div>
                </div>
            </div>
          </div>
          <div class="vstack gap-sm-0 gap-2">
            <div class="w-100">
               <form id="formAddToCart">
                    <input type="hidden" name="id" />
                    <input type="hidden" name="price" />
                    <button  class="btn btn-secondary text-nowrap px-5 w-100 py-2 font-weight-700 radius-10 rounded-10 border-0 add-to-cart" style="background: #513819">
                        Add to cart
                    </button>
               </form>
            </div>
            <div class="mt-2 w-100">
                <form id="formRemoveCart">
                    <input type="hidden" name="id" />
                    <button data-id="" class="btn btn-white text-nowrap px-5 w-100 py-2 font-weight-700 radius-10 rounded-10 border-0 cancel-qty" style="background: #E4E4E4; color: #513819">
                        Remove from cart
                    </button>
                </form>
            </div>
          </div>
        </div>
      </div>
    </div>
</div>
@endpush

@push('js')
<script>
    const code_table = "{{ $code_table }}";
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="{{ asset('assets/frontend/js/checkoutMenu.js') }}"></script>
@endpush
@endsection

