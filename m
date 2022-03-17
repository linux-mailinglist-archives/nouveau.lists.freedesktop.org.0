Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 453E14E86B7
	for <lists+nouveau@lfdr.de>; Sun, 27 Mar 2022 09:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5112B892D8;
	Sun, 27 Mar 2022 07:44:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16B610EAE0
 for <nouveau@lists.freedesktop.org>; Thu, 17 Mar 2022 03:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647487798; x=1679023798;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AzMb0/YG2S8LI24My11FysIdAjjvdmOrV481bVhZgTI=;
 b=CkMGkFC0ykulvijb1PNe36arxa06H5nrM19HGU3vCFw6XWczWus9rvjH
 t8gfFajYUua194pG2i3T/GyMZjtRHZohJegOjAO9OQmJTeow8o7IOgzXj
 kcOB6FmcgNWKWidZeNQAR/qcjFynQCM1lWTposfsVZaMVKzJwhzOIrtIX
 5af3kZuwI9Hle5GhuKM9PYTMrBaoCYbL9xE67BRU51LwGTKgLF+fk43py
 Q2at8z4UKu4A6gTp+xf1IBkhRXiAxypw3e9TrptMl5WyrvP+nGQKZn9xN
 ggN+xv2UufIygm8FDStFzLA7PvoBpY0PclGp6hCDnf/j0KQM96unBTzHP g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="317491517"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="317491517"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 20:29:57 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="635225301"
Received: from mbhanuva-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.30.158])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 20:29:56 -0700
Date: Wed, 16 Mar 2022 20:29:55 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <YjKrMyRvHh7nzHwW@iweiny-desk3>
References: <20220316192010.19001-1-rdunlap@infradead.org>
 <20220316192010.19001-7-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220316192010.19001-7-rdunlap@infradead.org>
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
 Arnd Bergmann <arnd@arndb.de>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org,
 Jakub Kicinski <kuba@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Joachim Fritschi <jfritschi@freenet.de>,
 Felipe Balbi <felipe.balbi@linux.intel.com>, Amit Shah <amit@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
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

On Wed, Mar 16, 2022 at 12:20:07PM -0700, Randy Dunlap wrote:
> Eliminate anonymous module_init() and module_exit(), which can lead to
> confusion or ambiguity when reading System.map, crashes/oops/bugs,
> or an initcall_debug log.
> 
> Give each of these init and exit functions unique driver-specific
> names to eliminate the anonymous names.
> 
> Example 1: (System.map)
>  ffffffff832fc78c t init
>  ffffffff832fc79e t init
>  ffffffff832fc8f8 t init
> 
> Example 2: (initcall_debug log)
>  calling  init+0x0/0x12 @ 1
>  initcall init+0x0/0x12 returned 0 after 15 usecs
>  calling  init+0x0/0x60 @ 1
>  initcall init+0x0/0x60 returned 0 after 2 usecs
>  calling  init+0x0/0x9a @ 1
>  initcall init+0x0/0x9a returned 0 after 74 usecs
> 
> Fixes: bd25a14edb75 ("usb: gadget: legacy/serial: allow dynamic removal")
> Fixes: 7bb5ea54be47 ("usb gadget serial: use composite gadget framework")
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

I continue to be confused about the latest rules for the Fixes tag but this one
in particular seems completely useless.  This is the 'beginning of time' commit
by Linus AFAICT.  So do any of these Fixes tags need to be in this series?

Regardless:

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Felipe Balbi <felipe.balbi@linux.intel.com>
> Cc: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: linux-usb@vger.kernel.org
> ---
>  drivers/usb/gadget/legacy/inode.c  |    8 ++++----
>  drivers/usb/gadget/legacy/serial.c |   10 +++++-----
>  drivers/usb/gadget/udc/dummy_hcd.c |    8 ++++----
>  3 files changed, 13 insertions(+), 13 deletions(-)
> 
> --- lnx-517-rc8.orig/drivers/usb/gadget/legacy/serial.c
> +++ lnx-517-rc8/drivers/usb/gadget/legacy/serial.c
> @@ -273,7 +273,7 @@ static struct usb_composite_driver gseri
>  static int switch_gserial_enable(bool do_enable)
>  {
>  	if (!serial_config_driver.label)
> -		/* init() was not called, yet */
> +		/* gserial_init() was not called, yet */
>  		return 0;
>  
>  	if (do_enable)
> @@ -283,7 +283,7 @@ static int switch_gserial_enable(bool do
>  	return 0;
>  }
>  
> -static int __init init(void)
> +static int __init gserial_init(void)
>  {
>  	/* We *could* export two configs; that'd be much cleaner...
>  	 * but neither of these product IDs was defined that way.
> @@ -314,11 +314,11 @@ static int __init init(void)
>  
>  	return usb_composite_probe(&gserial_driver);
>  }
> -module_init(init);
> +module_init(gserial_init);
>  
> -static void __exit cleanup(void)
> +static void __exit gserial_cleanup(void)
>  {
>  	if (enable)
>  		usb_composite_unregister(&gserial_driver);
>  }
> -module_exit(cleanup);
> +module_exit(gserial_cleanup);
> --- lnx-517-rc8.orig/drivers/usb/gadget/udc/dummy_hcd.c
> +++ lnx-517-rc8/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -2765,7 +2765,7 @@ static struct platform_driver dummy_hcd_
>  static struct platform_device *the_udc_pdev[MAX_NUM_UDC];
>  static struct platform_device *the_hcd_pdev[MAX_NUM_UDC];
>  
> -static int __init init(void)
> +static int __init dummy_hcd_init(void)
>  {
>  	int	retval = -ENOMEM;
>  	int	i;
> @@ -2887,9 +2887,9 @@ err_alloc_udc:
>  		platform_device_put(the_hcd_pdev[i]);
>  	return retval;
>  }
> -module_init(init);
> +module_init(dummy_hcd_init);
>  
> -static void __exit cleanup(void)
> +static void __exit dummy_hcd_cleanup(void)
>  {
>  	int i;
>  
> @@ -2905,4 +2905,4 @@ static void __exit cleanup(void)
>  	platform_driver_unregister(&dummy_udc_driver);
>  	platform_driver_unregister(&dummy_hcd_driver);
>  }
> -module_exit(cleanup);
> +module_exit(dummy_hcd_cleanup);
> --- lnx-517-rc8.orig/drivers/usb/gadget/legacy/inode.c
> +++ lnx-517-rc8/drivers/usb/gadget/legacy/inode.c
> @@ -2101,7 +2101,7 @@ MODULE_ALIAS_FS("gadgetfs");
>  
>  /*----------------------------------------------------------------------*/
>  
> -static int __init init (void)
> +static int __init gadgetfs_init (void)
>  {
>  	int status;
>  
> @@ -2111,12 +2111,12 @@ static int __init init (void)
>  			shortname, driver_desc);
>  	return status;
>  }
> -module_init (init);
> +module_init (gadgetfs_init);
>  
> -static void __exit cleanup (void)
> +static void __exit gadgetfs_cleanup (void)
>  {
>  	pr_debug ("unregister %s\n", shortname);
>  	unregister_filesystem (&gadgetfs_type);
>  }
> -module_exit (cleanup);
> +module_exit (gadgetfs_cleanup);
>  
