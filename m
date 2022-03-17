Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB8E4E8696
	for <lists+nouveau@lfdr.de>; Sun, 27 Mar 2022 09:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151CD10E037;
	Sun, 27 Mar 2022 07:44:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA25910E103
 for <nouveau@lists.freedesktop.org>; Thu, 17 Mar 2022 20:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=3Vg3YWtqMNGIO5AWtFE29onUKdIZ8x188s7SviF5pPg=; b=tiAHL3PCQ2t7+lPOxKztKxihGl
 vd4Y8NiotnXISBxPTEpDpjnfGwN/+2gCzocwX9f1n0YfUlqtTEW8abkTbOXNks1/pe9V0o1aeVqiU
 mg+cp1CpvBpg/qj5G5LZWflb4aiFP803B14dktG2eQTzUpOmEwNqtoyK5FiuDb0e8dEHA1UwaTcNb
 TjTsqtIXdQy5uDTkofF/krC+Z1b0PK1+/Sh9yQPukGAwmINpZ+kCjgEBdHe1EVJZaGIr2Nw3tHUkm
 Ajhuyth6TCxfsRDyg2dioL17ZEbHaHLKorjuGU+sNiNOS0MkF5l5E/OHgiJGeyQY6IVrPFktt2Xla
 WvlJyMgw==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUwxB-007IuO-IC; Thu, 17 Mar 2022 20:42:37 +0000
Message-ID: <15fdafd4-e753-2c0e-4e61-6b168e064e72@infradead.org>
Date: Thu, 17 Mar 2022 13:42:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Pablo Neira Ayuso <pablo@netfilter.org>
References: <20220316192010.19001-1-rdunlap@infradead.org>
 <20220316192010.19001-5-rdunlap@infradead.org> <YjNYo2LKM3smgEJM@salvia>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <YjNYo2LKM3smgEJM@salvia>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 27 Mar 2022 07:44:03 +0000
Subject: Re: [Nouveau] [PATCH 4/9] netfilter: h323: eliminate anonymous
 module_init & module_exit
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: x86@kernel.org, Andy Lutomirski <luto@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 nouveau@lists.freedesktop.org, Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Valentina Manea <valentina.manea.m@gmail.com>,
 Krzysztof Opasiak <k.opasiak@samsung.com>, Eli Cohen <eli@mellanox.com>,
 netdev@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org,
 Jakub Kicinski <kuba@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joachim Fritschi <jfritschi@freenet.de>,
 Felipe Balbi <felipe.balbi@linux.intel.com>, Amit Shah <amit@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 linux-block@vger.kernel.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Jussi Kivilinna <jussi.kivilinna@mbnet.fi>,
 virtualization@lists.linux-foundation.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Jens Axboe <axboe@kernel.dk>,
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Igor Kotrasinski <i.kotrasinsk@samsung.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>



On 3/17/22 08:49, Pablo Neira Ayuso wrote:
> On Wed, Mar 16, 2022 at 12:20:05PM -0700, Randy Dunlap wrote:
>> Eliminate anonymous module_init() and module_exit(), which can lead to
>> confusion or ambiguity when reading System.map, crashes/oops/bugs,
>> or an initcall_debug log.
>>
>> Give each of these init and exit functions unique driver-specific
>> names to eliminate the anonymous names.
>>
>> Example 1: (System.map)
>>  ffffffff832fc78c t init
>>  ffffffff832fc79e t init
>>  ffffffff832fc8f8 t init
>>
>> Example 2: (initcall_debug log)
>>  calling  init+0x0/0x12 @ 1
>>  initcall init+0x0/0x12 returned 0 after 15 usecs
>>  calling  init+0x0/0x60 @ 1
>>  initcall init+0x0/0x60 returned 0 after 2 usecs
>>  calling  init+0x0/0x9a @ 1
>>  initcall init+0x0/0x9a returned 0 after 74 usecs
> 
> LGTM.
> 
> Should I route this through the netfilter tree?

Yes, please.
Thanks.

> 
>> Fixes: f587de0e2feb ("[NETFILTER]: nf_conntrack/nf_nat: add H.323 helper port")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Pablo Neira Ayuso <pablo@netfilter.org>
>> Cc: Jozsef Kadlecsik <kadlec@netfilter.org>
>> Cc: Florian Westphal <fw@strlen.de>
>> Cc: netfilter-devel@vger.kernel.org
>> Cc: coreteam@netfilter.org
>> Cc: "David S. Miller" <davem@davemloft.net>
>> Cc: Jakub Kicinski <kuba@kernel.org>
>> Cc: netdev@vger.kernel.org
>> ---
>>  net/ipv4/netfilter/nf_nat_h323.c |    8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> --- lnx-517-rc8.orig/net/ipv4/netfilter/nf_nat_h323.c
>> +++ lnx-517-rc8/net/ipv4/netfilter/nf_nat_h323.c
>> @@ -580,7 +580,7 @@ static struct nf_ct_helper_expectfn call
>>  };
>>  
>>  /****************************************************************************/
>> -static int __init init(void)
>> +static int __init nf_nat_h323_init(void)
>>  {
>>  	BUG_ON(set_h245_addr_hook != NULL);
>>  	BUG_ON(set_h225_addr_hook != NULL);
>> @@ -607,7 +607,7 @@ static int __init init(void)
>>  }
>>  
>>  /****************************************************************************/
>> -static void __exit fini(void)
>> +static void __exit nf_nat_h323_fini(void)
>>  {
>>  	RCU_INIT_POINTER(set_h245_addr_hook, NULL);
>>  	RCU_INIT_POINTER(set_h225_addr_hook, NULL);
>> @@ -624,8 +624,8 @@ static void __exit fini(void)
>>  }
>>  
>>  /****************************************************************************/
>> -module_init(init);
>> -module_exit(fini);
>> +module_init(nf_nat_h323_init);
>> +module_exit(nf_nat_h323_fini);
>>  
>>  MODULE_AUTHOR("Jing Min Zhao <zhaojingmin@users.sourceforge.net>");
>>  MODULE_DESCRIPTION("H.323 NAT helper");

-- 
~Randy
