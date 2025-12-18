Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA1ECCC933
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 16:53:01 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A481210EA34;
	Thu, 18 Dec 2025 15:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BkBB5tBA";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A23A344B90;
	Thu, 18 Dec 2025 15:45:29 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766072729;
 b=nAx/JeiV3rDsWF+hvDdBNLRAoUQ891GWVLF/V5/LZxq0em6HnEmONzjXSUTYRdiAg0uNq
 HyvNEkEYU93h5ffIQT3TGo6MyYVlhOj8MzwCQq0swip4MeiB66TVaXTWgg0o4HXaMhw03yD
 v5T0yZcgj5S4xDpKohAJVbhYOB+yooBac1GWBjZF7zGfa/4K2VPWqHua6rOFOKJ+4ElCTZH
 3oySqYY9MV/Avzg3bkG1uwtG9SXzXdhEy1ip/JX4W3EqxRCKSYexU2E8Ka1R1QyW4KvFv9g
 Fc9l9YMskhQl/JdHE27PwkzrsWCYqotYj8eebRtzl94JgyNv7NGyekEDLEgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766072729; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=T0tKm+ulUll0TYwQo+jQYWcOm8Te3To9oKXRxXv8Ato=;
 b=JktlE2QMzG5qk5U24+VGZGH+DLXy831xoDFTv3AqbS4d1u8V45j2nVqbRI04Y8S5WB1S3
 /YCBtKDZzfVnJ6E/KvEYeXVhoG96zoE0WlBf6IVFLx3EaNnEd3gWC3K+Wr22Ag8lAs7GPEh
 GBPXWvUj8tTJGameKVHYDg62vyXIUKx/pvypKQu6RKvZmxOnqnbW8OrVpzGCdICr6l2Ywk4
 4/skEWpEjTwFEVtgNuRIOR1HSJq1NZmvkjDwSMQfOE+I8h5Xxe32S5nJALyxcFEu5Wnm7pZ
 k5xg0h0IisyaPkLfAredZPAzXkcVT6d+MJ7uOotVE6AOWtF29QOeGEW8iqpA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id EB27844B89
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 15:45:26 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B3A9010EA33;
	Thu, 18 Dec 2025 15:52:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C453560010;
	Thu, 18 Dec 2025 15:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01138C116C6;
	Thu, 18 Dec 2025 15:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766073176;
	bh=gP/NY4VcXW0E9tzTPCUNhKx98dDbfmaXHBU2kHHZSmM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BkBB5tBAZy+q0QB7G58o/DIVVEqWtHlvApA7ZlCNKFSoUEZB/enREzDJvK5oEdPLF
	 lX0E0ZJ1rH39QIlitGkG/zbItC7yOx+f99rI65VVCU/4xTI9iKvIrTO/G0RoF55YR0
	 MH2kdsUoJDIBNFrMUJDsUtbju/g+7WgBYU0fw9YpthJWXEEC9V/BVw4M5ZFkuEjNam
	 MuGgVTKGVbUavh/sp3ZINz0Cu7sogP4V77TLNiCVd8linj5dXmiCAUf0dSx/wF9u2Q
	 c+R41M8hG0VVSYev2iUNxkhxWu2ZdUXbqnG8jkwzTJ1qQjXcqSthMJGIclmNqtrccf
	 1PGd5OXHDc6iQ==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com,
	jhubbard@nvidia.com,
	apopple@nvidia.com,
	joelagnelf@nvidia.com,
	aliceryhl@google.com,
	lossin@kernel.org
Subject: [PATCH 2/4] gpu: nova-core: fw: move appropriate code into pin
 initializer
Date: Thu, 18 Dec 2025 16:50:49 +0100
Message-ID: <20251218155239.25243-3-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218155239.25243-1-dakr@kernel.org>
References: <20251218155239.25243-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HOZBC7LEFMIN3XFFTGCLDKNNDIEKXPMY
X-Message-ID-Hash: HOZBC7LEFMIN3XFFTGCLDKNNDIEKXPMY
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HOZBC7LEFMIN3XFFTGCLDKNNDIEKXPMY/>
Archived-At: 
 <https://lore.freedesktop.org/20251218155239.25243-3-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Relocate the code that technically fits in the pin initializer into the
initializer itself.

While, thanks to pin_init_scope(), it is also possible to keep it as is,
moving appropriate code into the initializer has the advantage that it
structures the dependencies of fields naturally.

For instance, intermediate data that is only needed for a single field
goes into the initializer block of this field, making it obvious that it
is not needed by anything else.

On the other hand, intermediate data that is needed for multiple fields
to initialize remains above the initializer, naturally indicating that
it is needed my multiple fields.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 34 ++++++++++++++-------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index e034268be3c5..da97814cf859 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -159,18 +159,9 @@ pub(crate) fn new<'a>(
         ver: &'a str,
     ) -> impl PinInit<Self, Error> + 'a {
         pin_init::pin_init_scope(move || {
-            let fw = super::request_firmware(dev, chipset, "gsp", ver)?;
+            let firmware = super::request_firmware(dev, chipset, "gsp", ver)?;
 
-            let fw_section = elf::elf64_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
-
-            let sigs_section = match chipset.arch() {
-                Architecture::Ampere => ".fwsignature_ga10x",
-                Architecture::Ada => ".fwsignature_ad10x",
-                _ => return Err(ENOTSUPP),
-            };
-            let signatures = elf::elf64_section(fw.data(), sigs_section)
-                .ok_or(EINVAL)
-                .and_then(|data| DmaObject::from_data(dev, data))?;
+            let fw_section = elf::elf64_section(firmware.data(), ".fwimage").ok_or(EINVAL)?;
 
             let size = fw_section.len();
 
@@ -183,9 +174,6 @@ pub(crate) fn new<'a>(
                 })
                 .map_err(|_| ENOMEM)?;
 
-            let bl = super::request_firmware(dev, chipset, "bootloader", ver)?;
-            let bootloader = RiscvFirmware::new(dev, &bl)?;
-
             Ok(try_pin_init!(Self {
                 fw <- SGTable::new(dev, fw_vvec, DataDirection::ToDevice, GFP_KERNEL),
                 level2 <- {
@@ -227,8 +215,22 @@ pub(crate) fn new<'a>(
                     DmaObject::from_data(dev, &level0_data)?
                 },
                 size,
-                signatures,
-                bootloader,
+                signatures: {
+                    let sigs_section = match chipset.arch() {
+                        Architecture::Ampere => ".fwsignature_ga10x",
+                        Architecture::Ada => ".fwsignature_ad10x",
+                        _ => return Err(ENOTSUPP),
+                    };
+
+                    elf::elf64_section(firmware.data(), sigs_section)
+                        .ok_or(EINVAL)
+                        .and_then(|data| DmaObject::from_data(dev, data))?
+                },
+                bootloader: {
+                    let bl = super::request_firmware(dev, chipset, "bootloader", ver)?;
+
+                    RiscvFirmware::new(dev, &bl)?
+                },
             }))
         })
     }
-- 
2.52.0

