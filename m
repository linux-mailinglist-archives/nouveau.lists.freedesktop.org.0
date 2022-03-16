Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD72B4E869D
	for <lists+nouveau@lfdr.de>; Sun, 27 Mar 2022 09:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1F710E14E;
	Sun, 27 Mar 2022 07:44:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B46610E9CC
 for <nouveau@lists.freedesktop.org>; Wed, 16 Mar 2022 19:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=X2j8KWKH7mPGrGuSOCsj6/Zr05knYdm/d0qKjoRqe/A=; b=bdC3zFz0aD/kHDcjfAyZbfQHBp
 7D/NlBM1amLmkH4B4sqKV2ufqUvJD88hTlKpyZ6VqDgekjK4FNGYILRpxkEqmQPADEL6WPYAAzU3c
 Sgrf+0emCMPKxF4geOisKrAEZIi126v6w7X5ziKEvg+Vo5Kfv7gQeEp68Rya/2NrsCbuCdD1F1eRO
 BniaXaZDMgIYFHq/3z0YvLS2w5qVtTdqdrrvR04+Nr2xp3obBSzkGzIwryyT9w7ppsZfrvdhEgpU1
 CvVbeb1+V8VRryF0rtfXsRiz/tX5kbeNaIbViAt6lEitADJHoianGTvyLAizZrpPdjB0SFmWrUO/U
 gzvEtNsQ==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUZBu-00EArp-Lx; Wed, 16 Mar 2022 19:20:14 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 16 Mar 2022 12:20:01 -0700
Message-Id: <20220316192010.19001-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 27 Mar 2022 07:44:03 +0000
Subject: [Nouveau] [PATCH 0/9] treewide: eliminate anonymous module_init &
 module_exit
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

There are a number of drivers that use "module_init(init)" and
"module_exit(exit)", which are anonymous names and can lead to
confusion or ambiguity when reading System.map, crashes/oops/bugs,
or an initcall_debug log.

Give each of these init and exit functions unique driver-specific
names to eliminate the anonymous names.

Example 1: (System.map)
 ffffffff832fc78c t init
 ffffffff832fc79e t init
 ffffffff832fc8f8 t init
 ffffffff832fca05 t init
 ffffffff832fcbd2 t init
 ffffffff83328f0e t init
 ffffffff8332c5b1 t init
 ffffffff8332d9eb t init
 ffffffff8332f0aa t init
 ffffffff83330e25 t init
 ffffffff833317a5 t init
 ffffffff8333dd6b t init

Example 2: (initcall_debug log)
 calling  init+0x0/0x12 @ 1
 initcall init+0x0/0x12 returned 0 after 15 usecs
 calling  init+0x0/0x60 @ 1
 initcall init+0x0/0x60 returned 0 after 2 usecs
 calling  init+0x0/0x9a @ 1
 initcall init+0x0/0x9a returned 0 after 74 usecs
 calling  init+0x0/0x73 @ 1
 initcall init+0x0/0x73 returned 0 after 6 usecs
 calling  init+0x0/0x73 @ 1
 initcall init+0x0/0x73 returned 0 after 4 usecs
 calling  init+0x0/0xf5 @ 1
 initcall init+0x0/0xf5 returned 0 after 27 usecs
 calling  init+0x0/0x7d @ 1
 initcall init+0x0/0x7d returned 0 after 11 usecs
 calling  init+0x0/0xc9 @ 1
 initcall init+0x0/0xc9 returned 0 after 19 usecs
 calling  init+0x0/0x9d @ 1
 initcall init+0x0/0x9d returned 0 after 37 usecs
 calling  init+0x0/0x63f @ 1
 initcall init+0x0/0x63f returned 0 after 411 usecs
 calling  init+0x0/0x171 @ 1
 initcall init+0x0/0x171 returned 0 after 61 usecs
 calling  init+0x0/0xef @ 1
 initcall init+0x0/0xef returned 0 after 3 usecs

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Amit Shah <amit@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Eli Cohen <eli@mellanox.com>
Cc: Saeed Mahameed <saeedm@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Jozsef Kadlecsik <kadlec@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Krzysztof Opasiak <k.opasiak@samsung.com>
Cc: Igor Kotrasinski <i.kotrasinsk@samsung.com>
Cc: Valentina Manea <valentina.manea.m@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Jussi Kivilinna <jussi.kivilinna@mbnet.fi>
Cc: Joachim Fritschi <jfritschi@freenet.de>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Karol Herbst <karolherbst@gmail.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: netfilter-devel@vger.kernel.org
Cc: coreteam@netfilter.org
Cc: netdev@vger.kernel.org
Cc: linux-block@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: linux-rdma@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: nouveau@lists.freedesktop.org
Cc: virtualization@lists.linux-foundation.org
Cc: x86@kernel.org

patches:
 [PATCH 1/9] virtio_blk: eliminate anonymous module_init & module_exit
 [PATCH 2/9] virtio_console: eliminate anonymous module_init & module_exit
 [PATCH 3/9] net: mlx5: eliminate anonymous module_init & module_exit
 [PATCH 4/9] netfilter: h323: eliminate anonymous module_init & module_exit
 [PATCH 5/9] virtio-scsi: eliminate anonymous module_init & module_exit
 [PATCH 6/9] usb: gadget: eliminate anonymous module_init & module_exit
 [PATCH 7/9] usb: usbip: eliminate anonymous module_init & module_exit
 [PATCH 8/9] x86/crypto: eliminate anonymous module_init & module_exit
 [PATCH 9/9] testmmiotrace: eliminate anonymous module_init & module_exit

diffstat:
 arch/x86/crypto/blowfish_glue.c                |    8 ++++----
 arch/x86/crypto/camellia_glue.c                |    8 ++++----
 arch/x86/crypto/serpent_avx2_glue.c            |    8 ++++----
 arch/x86/crypto/twofish_glue.c                 |    8 ++++----
 arch/x86/crypto/twofish_glue_3way.c            |    8 ++++----
 arch/x86/mm/testmmiotrace.c                    |    8 ++++----
 drivers/block/virtio_blk.c                     |    8 ++++----
 drivers/char/virtio_console.c                  |    8 ++++----
 drivers/net/ethernet/mellanox/mlx5/core/main.c |    8 ++++----
 drivers/scsi/virtio_scsi.c                     |    8 ++++----
 drivers/usb/gadget/legacy/inode.c              |    8 ++++----
 drivers/usb/gadget/legacy/serial.c             |   10 +++++-----
 drivers/usb/gadget/udc/dummy_hcd.c             |    8 ++++----
 drivers/usb/usbip/vudc_main.c                  |    8 ++++----
 net/ipv4/netfilter/nf_nat_h323.c               |    8 ++++----
 15 files changed, 61 insertions(+), 61 deletions(-)
