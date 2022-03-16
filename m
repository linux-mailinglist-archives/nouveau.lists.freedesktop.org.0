Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 193F64E8695
	for <lists+nouveau@lfdr.de>; Sun, 27 Mar 2022 09:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA40910E036;
	Sun, 27 Mar 2022 07:44:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F5210E9C9
 for <nouveau@lists.freedesktop.org>; Wed, 16 Mar 2022 19:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=4Krw3MostSzdRmJotMI0a/aFHrz6hD4Rnz4KlkBsZsY=; b=oMmN0YOyCxbwsqUbjdCoYoeLS5
 xwOMYvr9c6y0ZD0gLE9DMUnynweLItGGubfTLvG/AFTS8gDdpV6qbKOe2/SN3s2MVuCKG2ip8Mj1T
 daPYsOGmw7rRzY22M54r0qxbz7gAzmEjzHxFdcWBVn37bavK9d81on5K0p1gEE5WIrLXqWY8/fU6M
 s5P/mifVEcH7CseJqbey8V+DTjHnfTd9wcLrhUE4NbrJGroreYsn7JZe2n7d0wMy7AotAiFE9ZHGk
 8JL0YSuhRL0OVQ5l3GWEQSBBUdGvXVahxlykI44NQpLaQo/Se64NnCywaP3JRAx3A9pSa/0AcvqOF
 CO5qvuzA==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUZC5-00EArp-Jb; Wed, 16 Mar 2022 19:20:25 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 16 Mar 2022 12:20:07 -0700
Message-Id: <20220316192010.19001-7-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220316192010.19001-1-rdunlap@infradead.org>
References: <20220316192010.19001-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 27 Mar 2022 07:44:03 +0000
Subject: [Nouveau] [PATCH 6/9] usb: gadget: eliminate anonymous module_init
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
Cc: linux-usb@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 nouveau@lists.freedesktop.org, Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Valentina Manea <valentina.manea.m@gmail.com>,
 virtualization@lists.linux-foundation.org,
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
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 linux-block@vger.kernel.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Jussi Kivilinna <jussi.kivilinna@mbnet.fi>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jens Axboe <axboe@kernel.dk>,
 x86@kernel.org, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Florian Westphal <fw@strlen.de>,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Igor Kotrasinski <i.kotrasinsk@samsung.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Eliminate anonymous module_init() and module_exit(), which can lead to
confusion or ambiguity when reading System.map, crashes/oops/bugs,
or an initcall_debug log.

Give each of these init and exit functions unique driver-specific
names to eliminate the anonymous names.

Example 1: (System.map)
 ffffffff832fc78c t init
 ffffffff832fc79e t init
 ffffffff832fc8f8 t init

Example 2: (initcall_debug log)
 calling  init+0x0/0x12 @ 1
 initcall init+0x0/0x12 returned 0 after 15 usecs
 calling  init+0x0/0x60 @ 1
 initcall init+0x0/0x60 returned 0 after 2 usecs
 calling  init+0x0/0x9a @ 1
 initcall init+0x0/0x9a returned 0 after 74 usecs

Fixes: bd25a14edb75 ("usb: gadget: legacy/serial: allow dynamic removal")
Fixes: 7bb5ea54be47 ("usb gadget serial: use composite gadget framework")
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-usb@vger.kernel.org
---
 drivers/usb/gadget/legacy/inode.c  |    8 ++++----
 drivers/usb/gadget/legacy/serial.c |   10 +++++-----
 drivers/usb/gadget/udc/dummy_hcd.c |    8 ++++----
 3 files changed, 13 insertions(+), 13 deletions(-)

--- lnx-517-rc8.orig/drivers/usb/gadget/legacy/serial.c
+++ lnx-517-rc8/drivers/usb/gadget/legacy/serial.c
@@ -273,7 +273,7 @@ static struct usb_composite_driver gseri
 static int switch_gserial_enable(bool do_enable)
 {
 	if (!serial_config_driver.label)
-		/* init() was not called, yet */
+		/* gserial_init() was not called, yet */
 		return 0;
 
 	if (do_enable)
@@ -283,7 +283,7 @@ static int switch_gserial_enable(bool do
 	return 0;
 }
 
-static int __init init(void)
+static int __init gserial_init(void)
 {
 	/* We *could* export two configs; that'd be much cleaner...
 	 * but neither of these product IDs was defined that way.
@@ -314,11 +314,11 @@ static int __init init(void)
 
 	return usb_composite_probe(&gserial_driver);
 }
-module_init(init);
+module_init(gserial_init);
 
-static void __exit cleanup(void)
+static void __exit gserial_cleanup(void)
 {
 	if (enable)
 		usb_composite_unregister(&gserial_driver);
 }
-module_exit(cleanup);
+module_exit(gserial_cleanup);
--- lnx-517-rc8.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ lnx-517-rc8/drivers/usb/gadget/udc/dummy_hcd.c
@@ -2765,7 +2765,7 @@ static struct platform_driver dummy_hcd_
 static struct platform_device *the_udc_pdev[MAX_NUM_UDC];
 static struct platform_device *the_hcd_pdev[MAX_NUM_UDC];
 
-static int __init init(void)
+static int __init dummy_hcd_init(void)
 {
 	int	retval = -ENOMEM;
 	int	i;
@@ -2887,9 +2887,9 @@ err_alloc_udc:
 		platform_device_put(the_hcd_pdev[i]);
 	return retval;
 }
-module_init(init);
+module_init(dummy_hcd_init);
 
-static void __exit cleanup(void)
+static void __exit dummy_hcd_cleanup(void)
 {
 	int i;
 
@@ -2905,4 +2905,4 @@ static void __exit cleanup(void)
 	platform_driver_unregister(&dummy_udc_driver);
 	platform_driver_unregister(&dummy_hcd_driver);
 }
-module_exit(cleanup);
+module_exit(dummy_hcd_cleanup);
--- lnx-517-rc8.orig/drivers/usb/gadget/legacy/inode.c
+++ lnx-517-rc8/drivers/usb/gadget/legacy/inode.c
@@ -2101,7 +2101,7 @@ MODULE_ALIAS_FS("gadgetfs");
 
 /*----------------------------------------------------------------------*/
 
-static int __init init (void)
+static int __init gadgetfs_init (void)
 {
 	int status;
 
@@ -2111,12 +2111,12 @@ static int __init init (void)
 			shortname, driver_desc);
 	return status;
 }
-module_init (init);
+module_init (gadgetfs_init);
 
-static void __exit cleanup (void)
+static void __exit gadgetfs_cleanup (void)
 {
 	pr_debug ("unregister %s\n", shortname);
 	unregister_filesystem (&gadgetfs_type);
 }
-module_exit (cleanup);
+module_exit (gadgetfs_cleanup);
 
