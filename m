Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FB34E86A9
	for <lists+nouveau@lfdr.de>; Sun, 27 Mar 2022 09:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF12B10E21E;
	Sun, 27 Mar 2022 07:44:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 4011 seconds by postgrey-1.36 at gabe;
 Thu, 17 Mar 2022 06:09:41 UTC
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F30210EBE0
 for <nouveau@lists.freedesktop.org>; Thu, 17 Mar 2022 06:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=bTtyCTv8jHiRySjv+joBkY5T4kiLsInhhDpfMbwTL1s=; b=os+6uLP+YQvzPOsl13Jv5guvuH
 c88qjXZH5IySVlxqAYUihC2hbNJHZhERaN/9M1O+TRZA8WFEmSQGTv+E/uOHf9IEu5y58HmvUView
 tJqv1oexE/7GCbLX/RqjjjPHc0Nz4QT1PCSUsF7D8Jb/EYTGiFjELEvWYE7Gu9MYUTFHov/uRCRY7
 /x9sJUmFziSe300ACpWlnZupzoQCtmqCqtEMV0UdvwGyry98Nfw5QdyjOvLJ0JePVDhb/0YX8qdJT
 w7vRAVMjNtBdhuXSlAfQdRkRsVo81YE8w/5mlAJkMGGTpqeQHzUxEbTrcOVom5D0PCqAQ3d5CQPbP
 DH34JIfA==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUiEF-001mlP-TU; Thu, 17 Mar 2022 04:59:16 +0000
Message-ID: <5db1feea-f630-79e6-15cc-77babf58a429@infradead.org>
Date: Wed, 16 Mar 2022 21:59:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Ira Weiny <ira.weiny@intel.com>
References: <20220316192010.19001-1-rdunlap@infradead.org>
 <20220316192010.19001-7-rdunlap@infradead.org>
 <YjKrMyRvHh7nzHwW@iweiny-desk3>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <YjKrMyRvHh7nzHwW@iweiny-desk3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 27 Mar 2022 07:44:03 +0000
Subject: Re: [Nouveau] [PATCH 6/9] usb: gadget: eliminate anonymous
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
 Herbert Xu <herbert@gondor.apana.org.au>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org,
 Jakub Kicinski <kuba@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Joachim Fritschi <jfritschi@freenet.de>, Arnd Bergmann <arnd@arndb.de>,
 Amit Shah <amit@kernel.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 linux-block@vger.kernel.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Jussi Kivilinna <jussi.kivilinna@mbnet.fi>,
 virtualization@lists.linux-foundation.org, Jens Axboe <axboe@kernel.dk>,
 Felipe Balbi <balbi@kernel.org>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Igor Kotrasinski <i.kotrasinsk@samsung.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>



On 3/16/22 20:29, Ira Weiny wrote:
> On Wed, Mar 16, 2022 at 12:20:07PM -0700, Randy Dunlap wrote:
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
>>
>> Fixes: bd25a14edb75 ("usb: gadget: legacy/serial: allow dynamic removal")
>> Fixes: 7bb5ea54be47 ("usb gadget serial: use composite gadget framework")
>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> 
> I continue to be confused about the latest rules for the Fixes tag but this one
> in particular seems completely useless.  This is the 'beginning of time' commit
> by Linus AFAICT.  So do any of these Fixes tags need to be in this series?

I guess it mostly depends on whether they get applied to stable trees, but
it's entirely fine with me if they don't.

{I also corrected Felipe's email address here.}

> Regardless:
> 
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>

Thanks.

> 
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Felipe Balbi <felipe.balbi@linux.intel.com>
>> Cc: Michał Mirosław <mirq-linux@rere.qmqm.pl>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>> Cc: linux-usb@vger.kernel.org
>> ---
>>  drivers/usb/gadget/legacy/inode.c  |    8 ++++----
>>  drivers/usb/gadget/legacy/serial.c |   10 +++++-----
>>  drivers/usb/gadget/udc/dummy_hcd.c |    8 ++++----
>>  3 files changed, 13 insertions(+), 13 deletions(-)
>>
>> --- lnx-517-rc8.orig/drivers/usb/gadget/legacy/serial.c
>> +++ lnx-517-rc8/drivers/usb/gadget/legacy/serial.c
>> @@ -273,7 +273,7 @@ static struct usb_composite_driver gseri
>>  static int switch_gserial_enable(bool do_enable)
>>  {
>>  	if (!serial_config_driver.label)
>> -		/* init() was not called, yet */
>> +		/* gserial_init() was not called, yet */
>>  		return 0;
>>  
>>  	if (do_enable)
>> @@ -283,7 +283,7 @@ static int switch_gserial_enable(bool do
>>  	return 0;
>>  }
>>  
>> -static int __init init(void)
>> +static int __init gserial_init(void)
>>  {
>>  	/* We *could* export two configs; that'd be much cleaner...
>>  	 * but neither of these product IDs was defined that way.
>> @@ -314,11 +314,11 @@ static int __init init(void)
>>  
>>  	return usb_composite_probe(&gserial_driver);
>>  }
>> -module_init(init);
>> +module_init(gserial_init);
>>  
>> -static void __exit cleanup(void)
>> +static void __exit gserial_cleanup(void)
>>  {
>>  	if (enable)
>>  		usb_composite_unregister(&gserial_driver);
>>  }
>> -module_exit(cleanup);
>> +module_exit(gserial_cleanup);
>> --- lnx-517-rc8.orig/drivers/usb/gadget/udc/dummy_hcd.c
>> +++ lnx-517-rc8/drivers/usb/gadget/udc/dummy_hcd.c
>> @@ -2765,7 +2765,7 @@ static struct platform_driver dummy_hcd_
>>  static struct platform_device *the_udc_pdev[MAX_NUM_UDC];
>>  static struct platform_device *the_hcd_pdev[MAX_NUM_UDC];
>>  
>> -static int __init init(void)
>> +static int __init dummy_hcd_init(void)
>>  {
>>  	int	retval = -ENOMEM;
>>  	int	i;
>> @@ -2887,9 +2887,9 @@ err_alloc_udc:
>>  		platform_device_put(the_hcd_pdev[i]);
>>  	return retval;
>>  }
>> -module_init(init);
>> +module_init(dummy_hcd_init);
>>  
>> -static void __exit cleanup(void)
>> +static void __exit dummy_hcd_cleanup(void)
>>  {
>>  	int i;
>>  
>> @@ -2905,4 +2905,4 @@ static void __exit cleanup(void)
>>  	platform_driver_unregister(&dummy_udc_driver);
>>  	platform_driver_unregister(&dummy_hcd_driver);
>>  }
>> -module_exit(cleanup);
>> +module_exit(dummy_hcd_cleanup);
>> --- lnx-517-rc8.orig/drivers/usb/gadget/legacy/inode.c
>> +++ lnx-517-rc8/drivers/usb/gadget/legacy/inode.c
>> @@ -2101,7 +2101,7 @@ MODULE_ALIAS_FS("gadgetfs");
>>  
>>  /*----------------------------------------------------------------------*/
>>  
>> -static int __init init (void)
>> +static int __init gadgetfs_init (void)
>>  {
>>  	int status;
>>  
>> @@ -2111,12 +2111,12 @@ static int __init init (void)
>>  			shortname, driver_desc);
>>  	return status;
>>  }
>> -module_init (init);
>> +module_init (gadgetfs_init);
>>  
>> -static void __exit cleanup (void)
>> +static void __exit gadgetfs_cleanup (void)
>>  {
>>  	pr_debug ("unregister %s\n", shortname);
>>  	unregister_filesystem (&gadgetfs_type);
>>  }
>> -module_exit (cleanup);
>> +module_exit (gadgetfs_cleanup);
>>  

-- 
~Randy
