Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 679D9CD5F62
	for <lists+nouveau@lfdr.de>; Mon, 22 Dec 2025 13:20:18 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0D410E656;
	Mon, 22 Dec 2025 12:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WxPgH3Tb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B745044C4D;
	Mon, 22 Dec 2025 12:12:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766405555;
 b=fL/zDgzvWExggIDsr9eRKltVzWPc6XJUx3q+tQWl9wVynt9AOz+0EYAmDG/v+BQQYUR+F
 PHWRII/Wd+fp8XfN1MBwbkSYob+rr6WkizN+Y4SKI3i5OzYwHs+IGwikUoabtxJs0jfIEWZ
 dam/NB2LSUMPKAm1hNd+GvwMGdLaOO5c81LncS35TWAUUi6L5tkrGu+Ts684fj9EPSX+op1
 gIgZn+D7bd/CibfBtU5r7L14jm+3c7PTLyY2B11uOwMmb1XAimAgw32FRDpMHuFTsrx4eZ2
 KivbH0bmIpNFEa1Xxy6zv3hxLxUeiBmVI7pK5FZAu3G5RGY6Sg2Weo7YPttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766405555; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dKpN8gmTpuTy8E7gUTNI13ZQQEwT0OdBUrEISR+u+ns=;
 b=Po3XPqlKXcYsUukga2rogrozk037h0dsSsiFqtkbuahlVdKzeIeTKYxaMVVvK+Arz3/E6
 3KGhZNeoJkzuIoyxSvIiSE4ojEpwh0cR2a2xZ+9ChV2Hl8hIZ1MhDq+wMwyS2mXjpOPsKjZ
 MMFiPQzECzX9MwVanzR3BmPd0CDtmMbfQi/inol5J/ohO2aoU/kY2P08LrObKCxIo657SAO
 h8HrtcGp/92Jb1LpYXMmC3yyrl/hwU1beDdrBC3kLZwxvKnBfIz45bUfIqqdpO3M2sZR5IB
 A4kHdVzt3AwVw5bV/ZT+8ZHGHh6ZvFvHPAluUWxD+mHa69wCBb6fIRobIlsw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E594944C47
	for <nouveau@lists.freedesktop.org>; Mon, 22 Dec 2025 12:12:32 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC5610E166;
	Mon, 22 Dec 2025 12:20:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E8CF6001D;
	Mon, 22 Dec 2025 12:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C72C4CEF1;
	Mon, 22 Dec 2025 12:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766406011;
	bh=xUbDYRMhRGvhEuJm/NydkAH3/SfSiO2L4qbftyB1Grc=;
	h=From:Date:Subject:To:Cc:From;
	b=WxPgH3TbeDo3foUeQiDX3qnI3FSvuoqS+1+kd1cDo+3NE16ffUv3jBWNNRc48qOcv
	 ynhfbYuuaT/xtHNUZ2drLfkvsT4dmE1qeUR7mILlRA7Pvcd7loR2HGyfLoGcNGsZG7
	 tlonpH0G5or+dDWmWvt+hVUz74KWXmRWoEITbLW3LkhNRnVrStT3xnj24WtQDrtbUx
	 3pwKsebO5+uZpLG4x0WNDLOl+uEF8cwuDrJTM2ue8jJdFtbG8dRrZRT9D1lG7na7pv
	 ng3Bg+avHb852oZ3IfBjQm1qH4imaLsaoBFjVP58kOB2NqupVFlb0sbzI22hYFktgW
	 JJ+9oQBldRWZA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 22 Dec 2025 13:20:05 +0100
Subject: [PATCH] gpu: nova-core: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-cstr-nova-v1-1-0e2353d5debe@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQpAQBCA4VfRnG3ZEcmryGGNwTgs7SAl725x/
 Orvv0A5CCvUyQWBD1FZfIRNE6DJ+ZGN9NGAGRYWEQ3pFoxfDmfI5q5isn1WVhD7NfAg5/dq2t+
 6dzPT9g7gvh+naKmVbQAAAA==
X-Change-ID: 20251222-cstr-nova-c13a8ec1d068
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1766406007; l=3053;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=dUjHOkrrvsSc1u9P7jrlnCVchHjcZqseOJZTYW8zbyk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFOoY1nRi3XD+xbrraMdWOBTctqzUO+id/xxlMbErl10DPk89P1KTUKoGzzK9QYDvmuWu4vLYBL
 b6NB0ILdiOQA=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
Message-ID-Hash: 76UEM4JRGPPSGKCIFA3LRQ37T34VR5XZ
X-Message-ID-Hash: 76UEM4JRGPPSGKCIFA3LRQ37T34VR5XZ
X-MailFrom: tamird@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Tamir Duberstein <tamird@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/76UEM4JRGPPSGKCIFA3LRQ37T34VR5XZ/>
Archived-At: 
 <https://lore.freedesktop.org/20251222-cstr-nova-v1-1-0e2353d5debe@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Tamir Duberstein <tamird@gmail.com>

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/gpu/drm/nova/driver.rs  | 12 +++++-------
 drivers/gpu/nova-core/driver.rs |  5 ++---
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index 2246d8e104e0..d24ade17f7a0 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -1,8 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::{
-    auxiliary, c_str, device::Core, drm, drm::gem, drm::ioctl, prelude::*, sync::aref::ARef,
-};
+use kernel::{auxiliary, device::Core, drm, drm::gem, drm::ioctl, prelude::*, sync::aref::ARef};
 
 use crate::file::File;
 use crate::gem::NovaObject;
@@ -24,12 +22,12 @@ pub(crate) struct NovaData {
     major: 0,
     minor: 0,
     patchlevel: 0,
-    name: c_str!("nova"),
-    desc: c_str!("Nvidia Graphics"),
+    name: c"nova",
+    desc: c"Nvidia Graphics",
 };
 
-const NOVA_CORE_MODULE_NAME: &CStr = c_str!("NovaCore");
-const AUXILIARY_NAME: &CStr = c_str!("nova-drm");
+const NOVA_CORE_MODULE_NAME: &CStr = c"NovaCore";
+const AUXILIARY_NAME: &CStr = c"nova-drm";
 
 kernel::auxiliary_device_table!(
     AUX_TABLE,
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index b8b0cc0f2d93..5a4cc047bcfc 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -2,7 +2,6 @@
 
 use kernel::{
     auxiliary,
-    c_str,
     device::Core,
     devres::Devres,
     dma::Device,
@@ -82,7 +81,7 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
             unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
 
             let bar = Arc::pin_init(
-                pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0")),
+                pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0"),
                 GFP_KERNEL,
             )?;
 
@@ -90,7 +89,7 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
                 gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_ref())?),
                 _reg <- auxiliary::Registration::new(
                     pdev.as_ref(),
-                    c_str!("nova-drm"),
+                    c"nova-drm",
                     0, // TODO[XARR]: Once it lands, use XArray; for now we don't use the ID.
                     crate::MODULE_NAME
                 ),

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251222-cstr-nova-c13a8ec1d068

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

