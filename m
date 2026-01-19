Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9B7D3BBCF
	for <lists+nouveau@lfdr.de>; Tue, 20 Jan 2026 00:35:27 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA7910E547;
	Mon, 19 Jan 2026 23:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kl6VCdx+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6013C44CA9;
	Mon, 19 Jan 2026 23:26:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768865201;
 b=s4ffGov4o/NV8aNUx3GFfQtvhJrNVXOiJEXMR98a308WBkWkkSnc2VOW1SNq98sn2iZIR
 67h1XCQxgHDRQjEL4HWQ1zB8TpKg7Tc51oHT8SuXKduJo1THEPHwLyjL2Jhe2IlhMkc1C9w
 L7RT1mG8kNDKlm36BACS4HpLodfpNxrFgafKK7FGgMv/j8ymVsaiI1fXyB5DzxpxhqGo4RN
 g8Td1OuGPSVoZjETJic4+yeSWEB4ItfcmKolbirs/HGCXGUaaByJbBXsDeW7Q8dAR7uJRyM
 Hk9EXpDLvA164rjGFY34gUcLLAq/blpmusNI5pBxaacGdKhmbERWTRp2NIFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768865201; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=iyot5w4eoQUDKQ7nZAm+2EOtg4XiEeeqyf6CQsMsPrg=;
 b=EqNA9nyVgOotWakxvFCgOe0T7TiBSfK9yQrt4Y+gLg/wlCYcbzKYLXWt8YNuZjBsMJHmj
 WrqC64pMryKfN2xxniSLhgUGB9/rISYKRfIpxm16j0gVppj0CCUnfYcOdHaU7tvctiHQofT
 0TIhxJKc8drOCbZfTgkm1EmEZ5sm6NkRw7EnHso2FkroZpOd5TBkn/sAXy/oivXUkyUbKos
 LHehIqAnfZ/nsdwacKB68R2hB5PvaU/dr/ktYWHK2czALVPOIiMZlTB7HFGFZpODIMwCwH5
 a9DgJCSpqPBQuEtuLjutWChDQ5nWwfHNn3hASv2e5IsWRFHoB78MZ2g3f1ow==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=collabora.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=collabora.com; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7509244BDC
	for <nouveau@lists.freedesktop.org>; Mon, 19 Jan 2026 23:26:38 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0BC10E0F6;
	Mon, 19 Jan 2026 23:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768865719;
	bh=A88efyBerG2kFCEntsoGVcNKXAjR7S2vi2d1WI2tu5c=;
	h=From:Subject:Date:To:Cc:From;
	b=kl6VCdx+SzkUkLXxiyyYUFXyqRI4waoxC+qP91ZVSGdsGvuxIN0+3rFNLN6FB/LlR
	 myHVS1S/f/LlW09DGFaye8SPQvGy4wBVFijbujjrFuQtwODrag6ajr8j2hJD9yconX
	 WNC30g+1QeP5StywSrfC1kBMIZt75zmBSOgqVh5K1pxeSvBjp8QxXPSE5Yku+nCAy6
	 iJcmWapwA1WjohduBnZP1XELn2ffhz5uIi5NDgsUrgVjv5Cod6QvAGx5rijPLLnHgi
	 kvuu9s9zU3RJ6VMy3c7QGm2QwVNyroarWaBDrba+dV83a8V8Gsz/rrsKRyhE/niPk9
	 rQuYGIEPyYqNw==
Received: from [192.168.0.79] (unknown
 [IPv6:2804:14d:72b4:81ae:67c:16ff:fe57:b5a3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 31EED17E07FA;
	Tue, 20 Jan 2026 00:35:17 +0100 (CET)
From: Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH 0/2] DRM 'feature' support for DRM drivers
Date: Mon, 19 Jan 2026 20:34:45 -0300
Message-Id: <20260119-drm-render-v1-0-8326e4d5cb44@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJW/bmkC/x3MMQqAMAxG4atIZguNaBCvIg5ifzWDVVIQQXp3i
 +M3vPdSgikSDdVLhluTnrGA64qWfY4bnIZianwjnllcsMMZYoA59B2EO2l5FSrBZVj1+WfjlPM
 HZtLWeVwAAAA=
X-Change-ID: 20260116-drm-render-e85e615641f6
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.14.3
Message-ID-Hash: 4L424TVDFWIYBNG2QXDMIZ5EFPGSZ3UF
X-Message-ID-Hash: 4L424TVDFWIYBNG2QXDMIZ5EFPGSZ3UF
X-MailFrom: daniel.almeida@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4L424TVDFWIYBNG2QXDMIZ5EFPGSZ3UF/>
Archived-At: 
 <https://lore.freedesktop.org/20260119-drm-render-v1-0-8326e4d5cb44@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This series introduces feature support for DRM drivers, as this will soon
be needed by Tyr and rvkms.

Patch 1 introduces the unsafe DriverFeatures trait. It underpins the design
by forcing drivers to comply with its safety requirements when enabling
features. It also introduces the compute_features() helper in order to
centralize the decision of which features to enable based on the value of
FeatureFoo::ENABLED.

Patch two showcases the design by implementing FEAT_RENDER. This adds a
safety requirement to the DriverFeatures trait that applies when the
corresponding feature is enabled. It is enabled on Tyr while Nova defaults
to NoRender, as it's unclear whether it's something that they want to
enable at the moment. This has the bonus of highlighting how features can
be disabled in a given driver in a non-disruptive manner.

Optionally, features can require that additional traits be implemented.
These traits may come with their own safety requirements and the type
system will ensure that they're indeed implemented if the feature is
enabled by the driver.

The commit message for patch one describes how this can be achieved in
rough terms. It's not a reference, though, as a lot of the boilerplate was
omitted for brevity. In any case, I tested an imaginary "ModesetOps" trait
in both Tyr and Nova and everything seems to work from a type system's
perspective.

Finally, the current approach is extensible as new features can be
described with traits and types without disrupting existing ones. They can
also convey their own safety requirements and even their own API, as
described above.

Please feel free to suggest new names for any of the types or patterns
used. They're somewhat illustrative and not intended as final.

---
Daniel Almeida (2):
      rust: drm: add support for driver features
      rust: drm: add FeatureRender

 drivers/gpu/drm/nova/driver.rs |  7 ++++++
 drivers/gpu/drm/tyr/driver.rs  | 11 +++++++++
 rust/kernel/drm/device.rs      | 14 +++++++++++-
 rust/kernel/drm/driver.rs      | 52 +++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 82 insertions(+), 2 deletions(-)
---
base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
change-id: 20260116-drm-render-e85e615641f6

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

