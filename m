Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 182304E86A6
	for <lists+nouveau@lfdr.de>; Sun, 27 Mar 2022 09:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4250910E1F3;
	Sun, 27 Mar 2022 07:44:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E7810EAE2
 for <nouveau@lists.freedesktop.org>; Thu, 17 Mar 2022 03:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647487975; x=1679023975;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fvSysYrUKMfGk8/VVxHhcMOBMFAuiZiHLOX32nrDtbU=;
 b=nRitGryC1s9Sl0gfi5NXBqXxuUaPQn9isOC7VKAMDOFgX0VGTMpOYZKu
 F7Og9/dd6CMvViuux3a8/nc+jkIfQAloLg34bMxatPon4bEpQEaBsYf9t
 Bh7VpWDNehttmHXJm+HWLDWig+xOxBLIshxAozzFqQ1yx4lcWXECTNt2F
 ElSlJkpsqYS9XRnxL4CB4Ju0kUyL6gEfoNE/BrQwZYF/Nurdjz6TnjiuA
 OHVjvI0JkUi9ipCLOlw9ufGTVfZib9FLkiYixR8U/eAuRxgNdjF8jt0YH
 1zJ+/0HEqDZrKfeyN9SokgSeOeaT4jlJn3xDVYR1N/U8NAp1V4HYzcEQw Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="254329697"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="254329697"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 20:32:55 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="613867506"
Received: from mbhanuva-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.30.158])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 20:32:54 -0700
Date: Wed, 16 Mar 2022 20:32:54 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <YjKr5vU6Vu8iW8VL@iweiny-desk3>
References: <20220316192010.19001-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220316192010.19001-1-rdunlap@infradead.org>
X-Mailman-Approved-At: Sun, 27 Mar 2022 07:44:03 +0000
Subject: Re: [Nouveau] [PATCH 0/9] treewide: eliminate anonymous module_init
 & module_exit
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

On Wed, Mar 16, 2022 at 12:20:01PM -0700, Randy Dunlap wrote:
> There are a number of drivers that use "module_init(init)" and
> "module_exit(exit)", which are anonymous names and can lead to
> confusion or ambiguity when reading System.map, crashes/oops/bugs,
> or an initcall_debug log.
> 
> Give each of these init and exit functions unique driver-specific
> names to eliminate the anonymous names.

I'm not fully sure about the Fixes tags but I don't see that it hurts anything.

For the series:

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> 
> Example 1: (System.map)
>  ffffffff832fc78c t init
>  ffffffff832fc79e t init
>  ffffffff832fc8f8 t init
>  ffffffff832fca05 t init
>  ffffffff832fcbd2 t init
>  ffffffff83328f0e t init
>  ffffffff8332c5b1 t init
>  ffffffff8332d9eb t init
>  ffffffff8332f0aa t init
>  ffffffff83330e25 t init
>  ffffffff833317a5 t init
>  ffffffff8333dd6b t init
> 
> Example 2: (initcall_debug log)
>  calling  init+0x0/0x12 @ 1
>  initcall init+0x0/0x12 returned 0 after 15 usecs
>  calling  init+0x0/0x60 @ 1
>  initcall init+0x0/0x60 returned 0 after 2 usecs
>  calling  init+0x0/0x9a @ 1
>  initcall init+0x0/0x9a returned 0 after 74 usecs
>  calling  init+0x0/0x73 @ 1
>  initcall init+0x0/0x73 returned 0 after 6 usecs
>  calling  init+0x0/0x73 @ 1
>  initcall init+0x0/0x73 returned 0 after 4 usecs
>  calling  init+0x0/0xf5 @ 1
>  initcall init+0x0/0xf5 returned 0 after 27 usecs
>  calling  init+0x0/0x7d @ 1
>  initcall init+0x0/0x7d returned 0 after 11 usecs
>  calling  init+0x0/0xc9 @ 1
>  initcall init+0x0/0xc9 returned 0 after 19 usecs
>  calling  init+0x0/0x9d @ 1
>  initcall init+0x0/0x9d returned 0 after 37 usecs
>  calling  init+0x0/0x63f @ 1
>  initcall init+0x0/0x63f returned 0 after 411 usecs
>  calling  init+0x0/0x171 @ 1
>  initcall init+0x0/0x171 returned 0 after 61 usecs
>  calling  init+0x0/0xef @ 1
>  initcall init+0x0/0xef returned 0 after 3 usecs
> 
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Amit Shah <amit@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Eli Cohen <eli@mellanox.com>
> Cc: Saeed Mahameed <saeedm@nvidia.com>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Pablo Neira Ayuso <pablo@netfilter.org>
> Cc: Jozsef Kadlecsik <kadlec@netfilter.org>
> Cc: Florian Westphal <fw@strlen.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
> Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
> Cc: Felipe Balbi <felipe.balbi@linux.intel.com>
> Cc: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Krzysztof Opasiak <k.opasiak@samsung.com>
> Cc: Igor Kotrasinski <i.kotrasinsk@samsung.com>
> Cc: Valentina Manea <valentina.manea.m@gmail.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Jussi Kivilinna <jussi.kivilinna@mbnet.fi>
> Cc: Joachim Fritschi <jfritschi@freenet.de>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Karol Herbst <karolherbst@gmail.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: netfilter-devel@vger.kernel.org
> Cc: coreteam@netfilter.org
> Cc: netdev@vger.kernel.org
> Cc: linux-block@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: linux-rdma@vger.kernel.org
> Cc: linux-scsi@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Cc: nouveau@lists.freedesktop.org
> Cc: virtualization@lists.linux-foundation.org
> Cc: x86@kernel.org
> 
> patches:
>  [PATCH 1/9] virtio_blk: eliminate anonymous module_init & module_exit
>  [PATCH 2/9] virtio_console: eliminate anonymous module_init & module_exit
>  [PATCH 3/9] net: mlx5: eliminate anonymous module_init & module_exit
>  [PATCH 4/9] netfilter: h323: eliminate anonymous module_init & module_exit
>  [PATCH 5/9] virtio-scsi: eliminate anonymous module_init & module_exit
>  [PATCH 6/9] usb: gadget: eliminate anonymous module_init & module_exit
>  [PATCH 7/9] usb: usbip: eliminate anonymous module_init & module_exit
>  [PATCH 8/9] x86/crypto: eliminate anonymous module_init & module_exit
>  [PATCH 9/9] testmmiotrace: eliminate anonymous module_init & module_exit
> 
> diffstat:
>  arch/x86/crypto/blowfish_glue.c                |    8 ++++----
>  arch/x86/crypto/camellia_glue.c                |    8 ++++----
>  arch/x86/crypto/serpent_avx2_glue.c            |    8 ++++----
>  arch/x86/crypto/twofish_glue.c                 |    8 ++++----
>  arch/x86/crypto/twofish_glue_3way.c            |    8 ++++----
>  arch/x86/mm/testmmiotrace.c                    |    8 ++++----
>  drivers/block/virtio_blk.c                     |    8 ++++----
>  drivers/char/virtio_console.c                  |    8 ++++----
>  drivers/net/ethernet/mellanox/mlx5/core/main.c |    8 ++++----
>  drivers/scsi/virtio_scsi.c                     |    8 ++++----
>  drivers/usb/gadget/legacy/inode.c              |    8 ++++----
>  drivers/usb/gadget/legacy/serial.c             |   10 +++++-----
>  drivers/usb/gadget/udc/dummy_hcd.c             |    8 ++++----
>  drivers/usb/usbip/vudc_main.c                  |    8 ++++----
>  net/ipv4/netfilter/nf_nat_h323.c               |    8 ++++----
>  15 files changed, 61 insertions(+), 61 deletions(-)
