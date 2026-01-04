Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2B9CF145D
	for <lists+nouveau@lfdr.de>; Sun, 04 Jan 2026 21:08:06 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D655410E360;
	Sun,  4 Jan 2026 20:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="iBRImHm3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UFXy0n8Z";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 812C644C81;
	Sun,  4 Jan 2026 19:59:55 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767556795;
 b=aMVosA0HK8//keEjR4CVb1aY4qddxYUi89PmnEmpYIn43P1+PBY76voBhFPQOwsPcC1St
 ZOVPRXextFC5QkihqqYZTNpyRGj0KENtHmZf2WfJd+BINRpdROKL2DbMEk+Y4Fr9qInllt7
 L1rbvgg3fmPArzGyppKtyKKNMphN4Z7Iw9JA1boKoirorzSxyP/yRSD2VvIRlPKgypiQTsq
 R861x0U9uZWwLmSq8kC1rVZmfxav2IAj6RerU0aY4wezTUarHbVEBQ68mCASa0LS5j3sbqN
 LCNjF1QKx5agrNNFsWedGo72XkRwQlVKQbIPuGXQScbnBDD7UHXqLJfTsrRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767556795; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=e1bFVgbKd2bGX2uopKiOokyPDAQ+3U4m878ja6n9ICc=;
 b=BHh9M/xZlpqA3huGWUB+NHcjHZEOU2kdtH0x1KNBOKebDfSklJNhkX4EfAGgWrHFbreUM
 2G4g1WkA5OyXAYQb5B0S3GbeYJ6Mg3qyLIcPB2JAz3Oytpkn2ndvF1eC6QBaKzXjfP0nUlE
 5U1rKFakRT7jqxz0iy6AvuECe3rFx7Mk6izJugXFa/pSg9DhJLHaNiYQaTtJroHwJkvZHHs
 mVAEydy/CtrbY0InPZE5l+2EL+fPvNtTZRpoOU7hkWZZ0U3bYi/vYFMpXkbRa1uP2iMo62k
 +KYJ6werZIEHUQR7fZ4FcgZjp6ffo3dzKKtLyOIMi8xTQ/kO2Ab3Uw5qTXUw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=mailbox.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=mailbox.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id AD38A446B8
	for <nouveau@lists.freedesktop.org>; Sun,  4 Jan 2026 19:59:52 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BAC1F10E328;
	Sun,  4 Jan 2026 20:08:01 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dkpQ834tVz9snJ;
	Sun,  4 Jan 2026 21:08:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1767557280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e1bFVgbKd2bGX2uopKiOokyPDAQ+3U4m878ja6n9ICc=;
	b=iBRImHm3YZKOSDLxCmKXIMmJGvBjZ1NNNHjSd7boqJT4IDXal4nqsANtNJTS5Hl0JqeDdE
	QC0FZTq79Lpta5jXrGtNSsSSd1vjgvsItpONmp8OTXRZFnNovolff/NVkbU1DUlVOWw7pu
	vMZos0A+hURWe+ghPEtHCMG1Ftm2TAKNDF3mmxpyfmVv9+/frcr+ky2d8pNMLsDa2GS4TO
	5VGNWJgay5ioIx8M7UXMO54rZpfrWaYAot5TSDK0GITk63LfhWQNo38kLrx1qglJyHw6mg
	5C6VHlMg8R6EKL2n2IiBazQfvvTmGd+eSSi7jQkKsPDD4vFj1yfGU+eshVcQBw==
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1767557278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e1bFVgbKd2bGX2uopKiOokyPDAQ+3U4m878ja6n9ICc=;
	b=UFXy0n8ZUlf+8CebJcoSFv4UsJbeRaURhXYI1Q7cFe4UBaVBx2sivR3wShdYcj2OKf9KmX
	VFuhG0WyQDkP223RgNDC02xuV7EqsPry3+mfXEsh5mNhmR9IfUu9JzJmY/KCUooWBHxqKv
	dxYdC43A6EYzWZ+XWDSr6YNhuVeiCbPx58c5sF0fG07JlJyq2wNI8fiyDkF15X4sbjrveM
	ac6WlqvWYXwJxDyS88X498SzQ0aBqu1COaj6AbGHou73hb0+dOMTyvrWQmyEnlUdHk9WI7
	cYadxzFM0Zv69BcRfzx/hzXeLc0ZSgj1szu0+Yb0yEasqxPFjVFBMKZETWzWaw==
To: dakr@kernel.org
Subject: [PATCH v2 2/2] gpu: nova-core: Use derive Display for Chipset enum
Date: Sun,  4 Jan 2026 21:07:32 +0100
Message-ID: <20260104200733.190494-3-mhi@mailbox.org>
In-Reply-To: <20260104200733.190494-1-mhi@mailbox.org>
References: <20260104200733.190494-1-mhi@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d7f6dc98ca0715cbf2a
X-MBO-RS-META: 41iyczy5oti6zqpyf4g16pc5jha3nowi
Message-ID-Hash: STKO6RDHGD5P4RQFPFJLWJUMCQWXQDMF
X-Message-ID-Hash: STKO6RDHGD5P4RQFPFJLWJUMCQWXQDMF
X-MailFrom: mhi@mailbox.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: aliceryhl@google.com, acourbot@nvidia.com, simona@ffwll.ch,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ojeda@kernel.org, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, mhi@mailbox.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/STKO6RDHGD5P4RQFPFJLWJUMCQWXQDMF/>
Archived-At: 
 <https://lore.freedesktop.org/20260104200733.190494-3-mhi@mailbox.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Use the derive macro for implementing fmt::Display on the Chipset enum
instead of relying on the compiler-generated Display output. This ensures
stable display strings that won't change unexpectedly.

Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
---
 drivers/gpu/nova-core/gpu.rs | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 629c9d2dc994..db2e913f85bf 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -4,6 +4,7 @@
     device,
     devres::Devres,
     fmt,
+    macros,
     pci,
     prelude::*,
     sync::Arc, //
@@ -26,7 +27,7 @@ macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
     {
         /// Enum representation of the GPU chipset.
-        #[derive(fmt::Debug, Copy, Clone, PartialOrd, Ord, PartialEq, Eq)]
+        #[derive(macros::Display, fmt::Debug, Copy, Clone, PartialOrd, Ord, PartialEq, Eq)]
         pub(crate) enum Chipset {
             $($variant = $value),*,
         }
@@ -107,20 +108,6 @@ pub(crate) fn arch(&self) -> Architecture {
     }
 }
 
-// TODO
-//
-// The resulting strings are used to generate firmware paths, hence the
-// generated strings have to be stable.
-//
-// Hence, replace with something like strum_macros derive(Display).
-//
-// For now, redirect to fmt::Debug for convenience.
-impl fmt::Display for Chipset {
-    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        write!(f, "{self:?}")
-    }
-}
-
 /// Enum representation of the GPU generation.
 ///
 /// TODO: remove the `Default` trait implementation, and the `#[default]`
-- 
2.51.2

