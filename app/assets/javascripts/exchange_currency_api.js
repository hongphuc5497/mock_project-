// set endpoint and your access key
$(document).ready(function () {
    // const ACCESS_KEY = 'b9b2af1ed1d7f0141724746d4f9bce37';
    const SYMBOLS = 'USD,KRW,TWD,CNY,THB,GBP,HKD,AUD,JPY';
    CurencyAPI();
    
});



function CurencyAPI(BASE='JPY'){
    let res='';
    $.ajax({
        url: 'https://api.exchangerate-api.com/v4/latest/' + BASE,
        dataType: 'json',
        success: function (json) {
            // exchange rata data is stored in json.rates
            $('.top_money_main .top_money_rate .top_money_date').html(json.date);
            $('.top_money_main .top_money_rate .top_money_change_rate').html(`1${json.base}  ≒  ${json.rates["EUR"]}EUR`)
            $('.top_money_change_btn').click(function () {
                
                
                let moneyorigin = $('#MoneyOrigin').html();
                let moneyexchange = $('#MoneyChange').html();

                if(moneyorigin == 'JPY'){
                      //change content exchangecurrency
                    $('.top_money_main .top_money_rate .top_money_change_rate').html(`1${json.base}  ≒  ${json.rates[moneyexchange]}${moneyexchange}`);
                    let amount_origin = $('#MoneyOrigin').parent().find('input.top_money_input').val();
                    let output_moneyexchange = $('#MoneyChange').parent().find('input.top_money_input');
                    output_moneyexchange.val(0);

                    if (amount_origin == '') {
                        $('#MoneyOrigin').parent().find('input.top_money_input').val(0);
                    } else {
                    let out = amount_origin * json.rates[moneyexchange];
                        output_moneyexchange.val(out);
                    }
                }
                else{
                    //change content exchangecurrency
                    $('.top_money_main .top_money_rate .top_money_change_rate').html(`1${moneyorigin}  ≒  ${1/json.rates[moneyorigin]}${moneyexchange}`);
                    let amount_origin = $('#MoneyOrigin').parent().find('input.top_money_input').val();
                    let output_moneyexchange = $('#MoneyChange').parent().find('input.top_money_input');
                    output_moneyexchange.val(0);
                    if (amount_origin == '') {
                        $('#MoneyOrigin').parent().find('input.top_money_input').val(0);
                    } else {

                        let out = amount_origin * (1 / json.rates[moneyorigin]);
                        output_moneyexchange.val(out);
                    }
                }
              
                

            });            

        }
    });
    
}
