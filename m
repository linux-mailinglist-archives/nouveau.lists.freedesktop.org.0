Return-Path: <nouveau-bounces@lists.freedesktop.org>
Delivered-To: lists+nouveau@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BgsHKzFb2lsMQAAu9opvQ
	(envelope-from <nouveau-bounces@lists.freedesktop.org>)
	for <lists+nouveau@lfdr.de>; Tue, 20 Jan 2026 19:13:00 +0100
X-Original-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E3149328
	for <lists+nouveau@lfdr.de>; Tue, 20 Jan 2026 19:13:00 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D082B10E648;
	Tue, 20 Jan 2026 18:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ie9DsuRA";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DFF2044CA9;
	Tue, 20 Jan 2026 18:04:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768932252;
 b=nSjOIH7JvhQgG8OHmZRlQ48BsG74rGQ29+YQrFVEZKNX2172zW8kk24XRz0Nk4gsa7/M3
 3s4BYwMAZWfO1j1lYC9Jfj2NAEzDXSXpQmGrmUABYEzT28mDPq77/+aBB9E6ETxgyBAtv/B
 f2AvxiKdynkBbC3y7i7GX7EJ31V4RNIi97GK0n3pY4AmGHRylyjNsdF+LG/hTpeowLZepUj
 yha+jD2hoba9cwWPjBjXLBYTA67kfLK0RgK7zcmCTBl4Z/tNDWMqAShYXFvq6M8ZVdQkl1L
 Wc4ufAPYXNTc8Ny+OTUuWRm6i0/9kojsn7xfwltMriUWcBOwitsjUT1vxudQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768932252; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Wulo3LjU0yHBx6vkvZw+QU4Hm2G89h8IrdRJ+ollruI=;
 b=XCweE6BcR2kxytCzilvdAiXH+LC7HMnrUCEwuK9c+gf9p/zzX8D0m3+iyD+hfuVynXR4v
 QKPTDW83ZQfCwUNdjyVI0ejc2yvO1sW6Pt0pNfAXx3fhP7ibyqXKXbyXpfNkoW4Dbn/5MHf
 rQm5ISA03E6P3l0jgYh6jT9t77UBE8v1pCvh8o8g9SnKgNY52H1BK+j84GBAhAiLKVnntDO
 BmVy7AO/JxlbrfQUSi4sQf6jW7XWPnxO4fOihnVeadg+7E/cKrYXA/SNilBuXYYg92SbvQa
 /y4nI89rM2WorLzsmafPgcrUbA8Z8a4JhyUA373tv7MKJGCz0/OQOYugjc1w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6C77144CA9
	for <nouveau@lists.freedesktop.org>; Tue, 20 Jan 2026 18:04:09 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 02E0089870;
	Tue, 20 Jan 2026 18:12:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E7AB960121;
	Tue, 20 Jan 2026 18:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333E1C16AAE;
	Tue, 20 Jan 2026 18:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768932772;
	bh=awIr1K1KTsidvoGcDEzmoe3Uym3Wj1XHUyBNXJs4cG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=Ie9DsuRAwNJgeZSyUGLJbWedFE0kXpPnOXakLQuLsu5+l+tSF9XFwUQNZZ0z2fRgR
	 HC1I7GYVw3uyNvltG48PEiFDw4MBIO5fmnVgjdXc+MM00BQvzZiSlOn6LWPuM2A74e
	 yhuky5knoSwhZMxZ2XK7NHyMnNAQQuUaPro8RGK9orJDROdbFA6G2GjSiQsgBBHeSr
	 7auecvhLOwr5mnpiiDtn9MDiYWpLQwfagw6UpW/BXM0XSkCl99xn4vmwX1b/vAmxyl
	 YZEkzla5DOnDx/cngCQry9bCkwrc1LqUIbqxo0T4phAR7CjfFDQE6coCais5SiccxL
	 kpjMiuoNoQ8AQ==
From: Gary Guo <gary@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Lyude Paul <lyude@redhat.com>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH 3/4] gpu: nova-core: remove redundant `.as_ref()` for `dev_*`
 print
Date: Tue, 20 Jan 2026 18:11:08 +0000
Message-ID: <20260120181152.3640314-3-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260120181152.3640314-1-gary@kernel.org>
References: <20260120181152.3640314-1-gary@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WYTSWK4MB5MLA3JICRD5ZFIKJHTXKLXJ
X-Message-ID-Hash: WYTSWK4MB5MLA3JICRD5ZFIKJHTXKLXJ
X-MailFrom: gary@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: Gary Guo <gary@garyguo.net>
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WYTSWK4MB5MLA3JICRD5ZFIKJHTXKLXJ/>
Archived-At: 
 <https://lore.freedesktop.org/20260120181152.3640314-3-gary@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>
X-Spamd-Result: default: False [3.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.freedesktop.org:s=20240201:i=1];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[nouveau@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:acourbot@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:apopple@nvidia.com,m:joelagnelf@nvidia.com,m:lyude@redhat.com,m:jhubbard@nvidia.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:nouveau@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-riscv@lists.infradead.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gary@kernel.org,nouveau-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,ffwll.ch,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[nouveau@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@kernel.org,nouveau-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[gary@garyguo.net];
	TAGGED_RCPT(0.00)[nouveau];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,garyguo.net:replyto]
X-Rspamd-Queue-Id: 22E3149328
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Gary Guo <gary@garyguo.net>

This is now handled by the macro itself.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 drivers/gpu/nova-core/driver.rs   |  2 +-
 drivers/gpu/nova-core/gpu.rs      |  4 ++--
 drivers/gpu/nova-core/gsp/boot.rs | 32 +++++++------------------------
 3 files changed, 10 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 5a4cc047bcfc..e39885c0d5ca 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -70,7 +70,7 @@ impl pci::Driver for NovaCore {
 
     fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
         pin_init::pin_init_scope(move || {
-            dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
+            dev_dbg!(pdev, "Probe Nova Core GPU driver.\n");
 
             pdev.enable_device_mem()?;
             pdev.set_master();
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9b042ef1a308..60c85fffaeaf 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -262,13 +262,13 @@ pub(crate) fn new<'a>(
     ) -> impl PinInit<Self, Error> + 'a {
         try_pin_init!(Self {
             spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
-                dev_info!(pdev.as_ref(),"NVIDIA ({})\n", spec);
+                dev_info!(pdev,"NVIDIA ({})\n", spec);
             })?,
 
             // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
             _: {
                 gfw::wait_gfw_boot_completion(bar)
-                    .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete\n"))?;
+                    .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
             },
 
             sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?,
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 581b412554dc..1582e1a65274 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -170,15 +170,10 @@ pub(crate) fn boot(
             Some(libos_handle as u32),
             Some((libos_handle >> 32) as u32),
         )?;
-        dev_dbg!(
-            pdev.as_ref(),
-            "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
-            mbox0,
-            mbox1
-        );
+        dev_dbg!(pdev, "GSP MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
 
         dev_dbg!(
-            pdev.as_ref(),
+            pdev,
             "Using SEC2 to load and run the booter_load firmware...\n"
         );
 
@@ -190,19 +185,10 @@ pub(crate) fn boot(
             Some(wpr_handle as u32),
             Some((wpr_handle >> 32) as u32),
         )?;
-        dev_dbg!(
-            pdev.as_ref(),
-            "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n",
-            mbox0,
-            mbox1
-        );
+        dev_dbg!(pdev, "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n", mbox0, mbox1);
 
         if mbox0 != 0 {
-            dev_err!(
-                pdev.as_ref(),
-                "Booter-load failed with error {:#x}\n",
-                mbox0
-            );
+            dev_err!(pdev, "Booter-load failed with error {:#x}\n", mbox0);
             return Err(ENODEV);
         }
 
@@ -216,11 +202,7 @@ pub(crate) fn boot(
             Delta::from_secs(5),
         )?;
 
-        dev_dbg!(
-            pdev.as_ref(),
-            "RISC-V active? {}\n",
-            gsp_falcon.is_riscv_active(bar),
-        );
+        dev_dbg!(pdev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(bar),);
 
         // Create and run the GSP sequencer.
         let seq_params = GspSequencerParams {
@@ -239,8 +221,8 @@ pub(crate) fn boot(
         // Obtain and display basic GPU information.
         let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
         match info.gpu_name() {
-            Ok(name) => dev_info!(pdev.as_ref(), "GPU name: {}\n", name),
-            Err(e) => dev_warn!(pdev.as_ref(), "GPU name unavailable: {:?}\n", e),
+            Ok(name) => dev_info!(pdev, "GPU name: {}\n", name),
+            Err(e) => dev_warn!(pdev, "GPU name unavailable: {:?}\n", e),
         }
 
         Ok(())
-- 
2.51.2

