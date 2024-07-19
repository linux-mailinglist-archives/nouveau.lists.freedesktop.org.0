Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F4D9376F6
	for <lists+nouveau@lfdr.de>; Fri, 19 Jul 2024 13:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FC210EBDD;
	Fri, 19 Jul 2024 11:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="Z3HBXcph";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="iDmpZHFk";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 593 seconds by postgrey-1.36 at gabe;
 Fri, 19 Jul 2024 11:01:38 UTC
Received: from flow4-smtp.messagingengine.com (flow4-smtp.messagingengine.com
 [103.168.172.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5601E10EBDD
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jul 2024 11:01:38 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailflow.nyi.internal (Postfix) with ESMTP id 742BC2000B7;
 Fri, 19 Jul 2024 06:51:44 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Fri, 19 Jul 2024 06:51:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1721386304; x=1721393504; bh=snau8pjlrT
 IlBYFHhAeSm3IIl4Zf9EVnI+lPjH52Fu8=; b=Z3HBXcphBEQWb//NJQ9l+W9ZKW
 OBbnK3/+rwK9uI9pZK2nNHelXW9Z/bP/2wc4cgqUZITmr3BEbz/AiTo1oel3VMYZ
 EhRdEg0y0lFwUP3JsjGiFJE9n1FY+3JZjsnar4Gq2DASAxHTxH0wFcZKlBvAWQOi
 6JGlpMBAlUwNOEv3LRbM0Thg49CI3/scGsj9NYb+RfAhR4tzGo4hTt8yiNV9pYqg
 /gVPs4jaKoWaWeFyj19MPUde/6cSqmN8BGA+ZDn/x8jS6uEhRRVfOOBpfvblySTX
 1GG3dxs8IrT3y4ExPdf9JbR9lLhO4bZEXY/He9NFRUJT8mTM/QW9jJdL1mwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1721386304; x=1721393504; bh=snau8pjlrTIlBYFHhAeSm3IIl4Zf
 9EVnI+lPjH52Fu8=; b=iDmpZHFky5pw44gpAg4Nr9919985laOcKHe8ogNwz0Fd
 s0QxxQN8D4T7pggLmcsFvB/cDQHc+6pkCu5jCEuxyo/PwfbLPLo5ld3x4hNwpi9f
 DJaVjItVrdrDQOECI7xiE4uRYd8wAuW9+YN1XdptlRDHtjbda1A6qbiIZ6/EhIHC
 e5CZ/eWUGmOpRXWdDHxN0iq7mNx/dytP2QbAZaRAp9sRzYcrMasBOkPGEBt+9z1o
 gfDA9+kEZ5Ws1+1G621TWWnk5/NXKFBR65HudNcUFH7bYO4ahCDbLJJeEYELHqUK
 U+A4Q2kIHoCMeEmDxHVMxqPdHP/lcqxCIYOCIByKwg==
X-ME-Sender: <xms:PkWaZkUfMylc-zbGdOQK5o5U9dbqz1uSPC1Kt9DaWahtWKT2YSrcbA>
 <xme:PkWaZolqbmoxSS4rWWa08il_02Fr9pXYSFc9A37FWdNUQsG_sum3kqEuB1JqB9xFM
 6-BnbVoikKioTBby4c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrhedugdeffecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
 udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:PkWaZobKZoAh34lEbgvtOaX5PBuGJaCUpADltnho3RXCI-M7t992Nw>
 <xmx:PkWaZjULJDIp92lesbHoZeYSuI_5ii7kPw-pW_lZyrRKjssWI3Cl2A>
 <xmx:PkWaZuknikK5YKCAOAmhIOFH4tkk3_YKlbZ5oSOzRHdlaABGT-h1jg>
 <xmx:PkWaZofwYM6FaYpVY0p5h3VQ0qhBNYUJj-2qqkMVMolTlytnxvHKRg>
 <xmx:QEWaZsuF_FJxQqbOfqieUqN9wrqpH8vTypvvs7J5CxPEbxs95fcjscV0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7A275B6008D; Fri, 19 Jul 2024 06:51:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <bdac7f10-4c65-4be2-952b-aed1af04e2c9@app.fastmail.com>
In-Reply-To: <2d168cf9-e456-4262-b276-95e992b8eac7@quicinc.com>
References: <2d168cf9-e456-4262-b276-95e992b8eac7@quicinc.com>
Date: Fri, 19 Jul 2024 12:51:21 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jeff Johnson" <quic_jjohnson@quicinc.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Russell King" <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
 "Stephen Boyd" <sboyd@kernel.org>, "Steven Rostedt" <rostedt@goodmis.org>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Karol Herbst" <karolherbst@gmail.com>,
 "Pekka Paalanen" <ppaalanen@gmail.com>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Andy Lutomirski" <luto@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>, 
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>
Subject: Re: MODULE_DESCRIPTION() patches with no maintainer action
Content-Type: text/plain
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sun, Jul 14, 2024, at 23:46, Jeff Johnson wrote:
> Andrew & Greg,
>
> I hate to bother you with such mundane patches, but the following have been
> posted for a while without any maintainer or reviewer comment or action, and
> they have not yet landed in linux-next.
>
> What is the path forward to have these MODULE_DESCRIPTION() warnings fixed?
>
> arch/arm/probes/kprobes/
> https://lore.kernel.org/all/20240622-md-arm-arch-arm-probes-kprobes-v1-1-0832bd6e45db@quicinc.com/
>
> arch/x86/mm/
> https://lore.kernel.org/all/20240515-testmmiotrace-md-v1-1-10919a8b2842@quicinc.com/
>
> drivers/spmi/
> https://lore.kernel.org/all/20240609-md-drivers-spmi-v1-1-f1d5b24e7a66@quicinc.com/
>
> (note that beyond these 3 patches I still have an additional 13 patches which
> need to land in order to fix these warnings tree-wide, but those 13 patches
> have had recent maintainer or reviewer action so I'm not seeking your help at
> this time).

Hi Jeff,

For completeness, this is a patch that I have in my local
test tree now after I addressed the build issues for all
randconfig builds on arm, arm64 and x86.

I assume you already a version of most of these,
but please have a look in case there are some still
missing.

   Arnd 

 arch/arm/lib/xor-neon.c                         | 1 +
 arch/x86/mm/testmmiotrace.c                     | 1 +
 drivers/fpga/tests/fpga-bridge-test.c           | 1 +
 drivers/fpga/tests/fpga-mgr-test.c              | 1 +
 drivers/fpga/tests/fpga-region-test.c           | 1 +
 drivers/fsi/fsi-core.c                          | 1 +
 drivers/fsi/fsi-master-aspeed.c                 | 2 ++
 drivers/fsi/fsi-master-ast-cf.c                 | 1 +
 drivers/fsi/fsi-master-gpio.c                   | 1 +
 drivers/fsi/fsi-master-hub.c                    | 1 +
 drivers/fsi/fsi-scom.c                          | 1 +
 drivers/xen/xenbus/xenbus_probe_frontend.c      | 1 +
 fs/adfs/super.c                                 | 2 ++
 fs/exportfs/expfs.c                             | 1 +
 kernel/locking/test-ww_mutex.c                  | 1 +
 lib/asn1_decoder.c                              | 1 +
 lib/slub_kunit.c                                | 1 +
 lib/ucs2_string.c                               | 1 +
 lib/zlib_inflate/inflate_syms.c                 | 1 +
 mm/kasan/kasan_test.c                           | 1 +
 mm/kasan/kasan_test_module.c                    | 1 +
 samples/livepatch/livepatch-callbacks-busymod.c | 1 +
 samples/livepatch/livepatch-callbacks-demo.c    | 1 +
 samples/livepatch/livepatch-callbacks-mod.c     | 1 +
 samples/livepatch/livepatch-sample.c            | 1 +
 samples/livepatch/livepatch-shadow-fix1.c       | 1 +
 samples/livepatch/livepatch-shadow-fix2.c       | 1 +
 security/apparmor/policy_unpack_test.c          | 1 +
 28 files changed, 30 insertions(+)

diff --git a/arch/arm/lib/xor-neon.c b/arch/arm/lib/xor-neon.c
index 522510baed49..fae19167ae0a 100644
--- a/arch/arm/lib/xor-neon.c
+++ b/arch/arm/lib/xor-neon.c
@@ -8,6 +8,7 @@
 #include <linux/raid/xor.h>
 #include <linux/module.h>
 
+MODULE_DESCRIPTION("NEON accelerated block XOR function");
 MODULE_LICENSE("GPL");
 
 #ifndef __ARM_NEON__
diff --git a/arch/x86/mm/testmmiotrace.c b/arch/x86/mm/testmmiotrace.c
index bda73cb7a044..ccafab530b1e 100644
--- a/arch/x86/mm/testmmiotrace.c
+++ b/arch/x86/mm/testmmiotrace.c
@@ -143,4 +143,5 @@ static void __exit cleanup(void)
 
 module_init(init);
 module_exit(cleanup);
+MODULE_DESCRIPTION("Test module for memory mapped I/O tracing");
 MODULE_LICENSE("GPL");
diff --git a/drivers/fpga/tests/fpga-bridge-test.c b/drivers/fpga/tests/fpga-bridge-test.c
index 2f7a24f23808..3a28f3cc7089 100644
--- a/drivers/fpga/tests/fpga-bridge-test.c
+++ b/drivers/fpga/tests/fpga-bridge-test.c
@@ -173,4 +173,5 @@ static struct kunit_suite fpga_bridge_suite = {
 
 kunit_test_suite(fpga_bridge_suite);
 
+MODULE_DESCRIPTION("KUnit test for the FPGA Bridge");
 MODULE_LICENSE("GPL");
diff --git a/drivers/fpga/tests/fpga-mgr-test.c b/drivers/fpga/tests/fpga-mgr-test.c
index 125b3a4d43c6..50419ba66667 100644
--- a/drivers/fpga/tests/fpga-mgr-test.c
+++ b/drivers/fpga/tests/fpga-mgr-test.c
@@ -324,4 +324,5 @@ static struct kunit_suite fpga_mgr_suite = {
 
 kunit_test_suite(fpga_mgr_suite);
 
+MODULE_DESCRIPTION("KUnit test for the FPGA Manager");
 MODULE_LICENSE("GPL");
diff --git a/drivers/fpga/tests/fpga-region-test.c b/drivers/fpga/tests/fpga-region-test.c
index bcf0651df261..b2ddd1f73d07 100644
--- a/drivers/fpga/tests/fpga-region-test.c
+++ b/drivers/fpga/tests/fpga-region-test.c
@@ -207,4 +207,5 @@ static struct kunit_suite fpga_region_suite = {
 
 kunit_test_suite(fpga_region_suite);
 
+MODULE_DESCRIPTION("KUnit test for the FPGA Region");
 MODULE_LICENSE("GPL");
diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 46ac5a8beab7..e2e1e9df6115 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -1444,5 +1444,6 @@ static void fsi_exit(void)
 }
 module_exit(fsi_exit);
 module_param(discard_errors, int, 0664);
+MODULE_DESCRIPTION("FSI core driver");
 MODULE_LICENSE("GPL");
 MODULE_PARM_DESC(discard_errors, "Don't invoke error handling on bus accesses");
diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index b0b624c3717b..a75cb8c8bace 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -670,4 +670,6 @@ static struct platform_driver fsi_master_aspeed_driver = {
 };
 
 module_platform_driver(fsi_master_aspeed_driver);
+
+MODULE_DESCRIPTION("FSI master driver for AST2600");
 MODULE_LICENSE("GPL");
diff --git a/drivers/fsi/fsi-master-ast-cf.c b/drivers/fsi/fsi-master-ast-cf.c
index f8c776ce1b56..aecaafaae8de 100644
--- a/drivers/fsi/fsi-master-ast-cf.c
+++ b/drivers/fsi/fsi-master-ast-cf.c
@@ -1438,5 +1438,6 @@ static struct platform_driver fsi_master_acf = {
 };
 
 module_platform_driver(fsi_master_acf);
+MODULE_DESCRIPTION("FSI master controller, using ASpeed Corefire microcontroller");
 MODULE_LICENSE("GPL");
 MODULE_FIRMWARE(FW_FILE_NAME);
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 10fc344b6b22..371810cdcd27 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -892,4 +892,5 @@ static struct platform_driver fsi_master_gpio_driver = {
 };
 
 module_platform_driver(fsi_master_gpio_driver);
+MODULE_DESCRIPTION("FSI master controller, using a simple GPIO bit-banging interface");
 MODULE_LICENSE("GPL");
diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 6d8b6e8854e5..6568fed7db3c 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -295,4 +295,5 @@ static struct fsi_driver hub_master_driver = {
 };
 
 module_fsi_driver(hub_master_driver);
+MODULE_DESCRIPTION("FSI hub master driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
index 61dbda9dbe2b..411ddc018cd8 100644
--- a/drivers/fsi/fsi-scom.c
+++ b/drivers/fsi/fsi-scom.c
@@ -625,4 +625,5 @@ static void scom_exit(void)
 
 module_init(scom_init);
 module_exit(scom_exit);
+MODULE_DESCRIPTION("SCOM FSI Client device driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/xen/xenbus/xenbus_probe_frontend.c b/drivers/xen/xenbus/xenbus_probe_frontend.c
index fcb335bb7b18..8b75f8234baf 100644
--- a/drivers/xen/xenbus/xenbus_probe_frontend.c
+++ b/drivers/xen/xenbus/xenbus_probe_frontend.c
@@ -513,4 +513,5 @@ static int __init boot_wait_for_devices(void)
 late_initcall(boot_wait_for_devices);
 #endif
 
+MODULE_DESCRIPTION("Frontend for Xen bus probe");
 MODULE_LICENSE("GPL");
diff --git a/fs/adfs/super.c b/fs/adfs/super.c
index 9354b14bbfe3..ea4488b1f234 100644
--- a/fs/adfs/super.c
+++ b/fs/adfs/super.c
@@ -491,4 +491,6 @@ static void __exit exit_adfs_fs(void)
 
 module_init(init_adfs_fs)
 module_exit(exit_adfs_fs)
+
+MODULE_DESCRIPTION("Acorn Disc Filing System");
 MODULE_LICENSE("GPL");
diff --git a/fs/exportfs/expfs.c b/fs/exportfs/expfs.c
index 4f2dd4ab4486..002599bfbe8d 100644
--- a/fs/exportfs/expfs.c
+++ b/fs/exportfs/expfs.c
@@ -597,4 +597,5 @@ struct dentry *exportfs_decode_fh(struct vfsmount *mnt, struct fid *fid,
 }
 EXPORT_SYMBOL_GPL(exportfs_decode_fh);
 
+MODULE_DESCRIPTION("Code mapping from inodes to NFS file handles");
 MODULE_LICENSE("GPL");
diff --git a/kernel/locking/test-ww_mutex.c b/kernel/locking/test-ww_mutex.c
index 78719e1ef1b1..2de48f8aa58e 100644
--- a/kernel/locking/test-ww_mutex.c
+++ b/kernel/locking/test-ww_mutex.c
@@ -695,5 +695,6 @@ static void __exit test_ww_mutex_exit(void)
 module_init(test_ww_mutex_init);
 module_exit(test_ww_mutex_exit);
 
+MODULE_DESCRIPTION("Module-based API test facility for ww_mutexes");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Intel Corporation");
diff --git a/lib/asn1_decoder.c b/lib/asn1_decoder.c
index 13da529e2e72..5738ae286b41 100644
--- a/lib/asn1_decoder.c
+++ b/lib/asn1_decoder.c
@@ -518,4 +518,5 @@ int asn1_ber_decoder(const struct asn1_decoder *decoder,
 }
 EXPORT_SYMBOL_GPL(asn1_ber_decoder);
 
+MODULE_DESCRIPTION("Decoder for ASN.1 BER/DER/CER encoded bytestream");
 MODULE_LICENSE("GPL");
diff --git a/lib/slub_kunit.c b/lib/slub_kunit.c
index e6667a28c014..2404e37633ab 100644
--- a/lib/slub_kunit.c
+++ b/lib/slub_kunit.c
@@ -187,4 +187,5 @@ static struct kunit_suite test_suite = {
 };
 kunit_test_suite(test_suite);
 
+MODULE_DESCRIPTION("Kunit tests for slub allocator");
 MODULE_LICENSE("GPL");
diff --git a/lib/ucs2_string.c b/lib/ucs2_string.c
index 9308bcfb2ad5..dfb4f2358cab 100644
--- a/lib/ucs2_string.c
+++ b/lib/ucs2_string.c
@@ -165,4 +165,5 @@ ucs2_as_utf8(u8 *dest, const ucs2_char_t *src, unsigned long maxlength)
 }
 EXPORT_SYMBOL(ucs2_as_utf8);
 
+MODULE_DESCRIPTION("UCS2 string handling");
 MODULE_LICENSE("GPL v2");
diff --git a/lib/zlib_inflate/inflate_syms.c b/lib/zlib_inflate/inflate_syms.c
index 9720114c0672..b8996d90e8bc 100644
--- a/lib/zlib_inflate/inflate_syms.c
+++ b/lib/zlib_inflate/inflate_syms.c
@@ -18,4 +18,5 @@ EXPORT_SYMBOL(zlib_inflateEnd);
 EXPORT_SYMBOL(zlib_inflateReset);
 EXPORT_SYMBOL(zlib_inflateIncomp); 
 EXPORT_SYMBOL(zlib_inflate_blob);
+MODULE_DESCRIPTION("Data decompression using the deflation algorithm");
 MODULE_LICENSE("GPL");
diff --git a/mm/kasan/kasan_test.c b/mm/kasan/kasan_test.c
index 7b32be2a3cf0..88b717ba34e8 100644
--- a/mm/kasan/kasan_test.c
+++ b/mm/kasan/kasan_test.c
@@ -1984,4 +1984,5 @@ static struct kunit_suite kasan_kunit_test_suite = {
 
 kunit_test_suite(kasan_kunit_test_suite);
 
+MODULE_DESCRIPTION("kunit test case for kasan");
 MODULE_LICENSE("GPL");
diff --git a/mm/kasan/kasan_test_module.c b/mm/kasan/kasan_test_module.c
index 27ec22767e42..f3f62c90df3e 100644
--- a/mm/kasan/kasan_test_module.c
+++ b/mm/kasan/kasan_test_module.c
@@ -78,4 +78,5 @@ static int __init kasan_test_module_init(void)
 }
 
 module_init(kasan_test_module_init);
+MODULE_DESCRIPTION("test module for KASAN");
 MODULE_LICENSE("GPL");
diff --git a/samples/livepatch/livepatch-callbacks-busymod.c b/samples/livepatch/livepatch-callbacks-busymod.c
index 378e2d40271a..4f9cb3de59f0 100644
--- a/samples/livepatch/livepatch-callbacks-busymod.c
+++ b/samples/livepatch/livepatch-callbacks-busymod.c
@@ -57,4 +57,5 @@ static void livepatch_callbacks_mod_exit(void)
 
 module_init(livepatch_callbacks_mod_init);
 module_exit(livepatch_callbacks_mod_exit);
+MODULE_DESCRIPTION("Live patching demo for (un)patching callbacks");
 MODULE_LICENSE("GPL");
diff --git a/samples/livepatch/livepatch-callbacks-demo.c b/samples/livepatch/livepatch-callbacks-demo.c
index 11c3f4357812..9e69d9caed25 100644
--- a/samples/livepatch/livepatch-callbacks-demo.c
+++ b/samples/livepatch/livepatch-callbacks-demo.c
@@ -192,5 +192,6 @@ static void livepatch_callbacks_demo_exit(void)
 
 module_init(livepatch_callbacks_demo_init);
 module_exit(livepatch_callbacks_demo_exit);
+MODULE_DESCRIPTION("Live patching demo for (un)patching callbacks");
 MODULE_LICENSE("GPL");
 MODULE_INFO(livepatch, "Y");
diff --git a/samples/livepatch/livepatch-callbacks-mod.c b/samples/livepatch/livepatch-callbacks-mod.c
index 2a074f422a51..d1851b471ad9 100644
--- a/samples/livepatch/livepatch-callbacks-mod.c
+++ b/samples/livepatch/livepatch-callbacks-mod.c
@@ -38,4 +38,5 @@ static void livepatch_callbacks_mod_exit(void)
 
 module_init(livepatch_callbacks_mod_init);
 module_exit(livepatch_callbacks_mod_exit);
+MODULE_DESCRIPTION("Live patching demo for (un)patching callbacks, support module");
 MODULE_LICENSE("GPL");
diff --git a/samples/livepatch/livepatch-sample.c b/samples/livepatch/livepatch-sample.c
index cd76d7ebe598..5263a2f31c48 100644
--- a/samples/livepatch/livepatch-sample.c
+++ b/samples/livepatch/livepatch-sample.c
@@ -66,5 +66,6 @@ static void livepatch_exit(void)
 
 module_init(livepatch_init);
 module_exit(livepatch_exit);
+MODULE_DESCRIPTION("Kernel Live Patching Sample Module");
 MODULE_LICENSE("GPL");
 MODULE_INFO(livepatch, "Y");
diff --git a/samples/livepatch/livepatch-shadow-fix1.c b/samples/livepatch/livepatch-shadow-fix1.c
index 6701641bf12d..25a03cca79c0 100644
--- a/samples/livepatch/livepatch-shadow-fix1.c
+++ b/samples/livepatch/livepatch-shadow-fix1.c
@@ -169,5 +169,6 @@ static void livepatch_shadow_fix1_exit(void)
 
 module_init(livepatch_shadow_fix1_init);
 module_exit(livepatch_shadow_fix1_exit);
+MODULE_DESCRIPTION("Live patching demo for shadow variables");
 MODULE_LICENSE("GPL");
 MODULE_INFO(livepatch, "Y");
diff --git a/samples/livepatch/livepatch-shadow-fix2.c b/samples/livepatch/livepatch-shadow-fix2.c
index 361046a4f10c..b99122cb221f 100644
--- a/samples/livepatch/livepatch-shadow-fix2.c
+++ b/samples/livepatch/livepatch-shadow-fix2.c
@@ -128,5 +128,6 @@ static void livepatch_shadow_fix2_exit(void)
 
 module_init(livepatch_shadow_fix2_init);
 module_exit(livepatch_shadow_fix2_exit);
+MODULE_DESCRIPTION("Live patching demo for shadow variables");
 MODULE_LICENSE("GPL");
 MODULE_INFO(livepatch, "Y");
diff --git a/security/apparmor/policy_unpack_test.c b/security/apparmor/policy_unpack_test.c
index 5c9bde25e56d..874fcf97794e 100644
--- a/security/apparmor/policy_unpack_test.c
+++ b/security/apparmor/policy_unpack_test.c
@@ -604,4 +604,5 @@ static struct kunit_suite apparmor_policy_unpack_test_module = {
 
 kunit_test_suite(apparmor_policy_unpack_test_module);
 
+MODULE_DESCRIPTION("KUnit tests for AppArmor's policy unpack");
 MODULE_LICENSE("GPL");
