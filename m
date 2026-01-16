Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE0FD387EF
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 21:48:44 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E319B10E93B;
	Fri, 16 Jan 2026 20:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PmVmG+xh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B248C44CAA;
	Fri, 16 Jan 2026 20:40:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768596005;
 b=RQFHIMyClHMeIjx90YBVMeVWtIbufpHVrd143hsstgsgU+fVitj8b1C3i2/hODV4W64nt
 0XbEKEwOA2igXbqHHpmHRk570NFnVHeSKXx+kNAGFQo4PxbfrUCFdyDNko5nADoMlg/5pRE
 qUU6RWOrQMR2IerAJGgOEC3dS9EPY2EsF7/iEKSKWlZJZlmPQzKdft44rbRMunodQKgMul5
 A8XkPf//shV/sZFaKDXxHFiMTf+zOom/adVVdeg8x41nyPL6+dsnJoVW4c1tZktvE3amlzg
 Jc3om+3/U2vLL90/RwHnyubdqDXvihadOD+fS6FDpV1no4GjBzeo/VSBszNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768596005; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CLsnGGgzFwX5I4axGZAFw6qRM7D95WrDoUBgXffWh40=;
 b=zDtr3MgVx/wg7Xhs4pr6odHWov3xS2lQ1LD3Ln8IlhHV683qwdwhuxPOC8bXp29ia3ZSX
 b444W0xnVuDE0GsaTPWGjRUsXXtWuLdMWtHhxNhhqEkzrwWyDVhTxDRJaUjzW0PXx0jah2H
 p/YdVNmSnXUnQ3DJVgIywZUJXTEBUpMDnNtVaMUzxEalmFKfUG9RrSFXMbSf+EyyHs0bK/o
 Hh3MNjFvhwqFq6NzQnSKAQDm5q2acKHGhKrgEm/M4+25aZgj8BSid01jL1asqfyv2kHqVJg
 esR6FTKIgBCNxNBJ9QHCKFa7YDZj6n0LalJ6zI+kzv0LtzlDAgVSO/V80vCg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4C4E440635
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 20:40:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 25BBD10E939
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 20:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768596518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CLsnGGgzFwX5I4axGZAFw6qRM7D95WrDoUBgXffWh40=;
	b=PmVmG+xhlULXo1dYXS82vwWbYmaVbmib9gsE6sjZbzjeYdxFA8hOi9fs2ur2IHukTDVhMS
	LPm8k0Q1xVucpFBhj7OkDm/kV22ddYQ55upt7cD9VBqbIuJ51o5Cjv/iSA68OnW5vNSPCO
	C9mIrYqHKKItRuU7pF4q18wcuFkcn+s=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-58-AfUrJ1WxPliM80U5W-_gCQ-1; Fri,
 16 Jan 2026 15:48:34 -0500
X-MC-Unique: AfUrJ1WxPliM80U5W-_gCQ-1
X-Mimecast-MFC-AGG-ID: AfUrJ1WxPliM80U5W-_gCQ_1768596512
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 325E218005B0;
	Fri, 16 Jan 2026 20:48:32 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.88.63])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 665FE19560A7;
	Fri, 16 Jan 2026 20:48:29 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Introduce DeviceContext
Date: Fri, 16 Jan 2026 15:41:40 -0500
Message-ID: <20260116204728.725579-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-ID-Hash: KKJUTZBFMPUG5O5AGFBFOOQEHBNBW7WO
X-Message-ID-Hash: KKJUTZBFMPUG5O5AGFBFOOQEHBNBW7WO
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: rust-for-linux@vger.kernel.org, Ewan Chorynski <ewan.chorynski@ik.me>,
 Miguel Ojeda <ojeda@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Asahi Lina <lina+kernel@asahilina.net>,
 Atharv Dubey <atharvd440@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KKJUTZBFMPUG5O5AGFBFOOQEHBNBW7WO/>
Archived-At: 
 <https://lore.freedesktop.org/20260116204728.725579-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Previous version of this patch series:
  https://lists.freedesktop.org/archives/dri-devel/2025-November/535387.html

One of the unsolved issues we still have with the rust DRM bindings is
the ability to limit certain Device operations to contexts where we can
guarantee that a Device has been fully initialized and registered with
userspace, or vice-versa (e.g. must be unregistered).

While the previous solution for this that I had was simply not exposing
drm::Device at all until the device has been registered with userspace,
unfortunately this isn't enough since:

* As we found out with Tyr, drivers occasionally need to be able to
  create GEM objects before device registration
* We would still need to be able to handle KMS callbacks which could be
  invoked after KMS init but before userspace registration (not handled
  in this series specifically, but DeviceContext will be required for
  handling this).

This patch series provides a pretty nice solution to this, by
implementing a very similar solution to kernel::device::DeviceContext:
introducing our own DeviceContext type state.

                          Series-wide changes

V2:
* s/DeviceCtx/DeviceContext/ for consistency
* Move private driver-data availability to the Registration
  DeviceContext
* s/AnyCtx/Init/

More changes described in each patch description.

Lyude Paul (3):
  rust/drm: Introduce DeviceContext
  rust/drm: Don't setup private driver data until registration
  rust/drm/gem: Use DeviceContext with GEM objects

 drivers/gpu/drm/nova/driver.rs |  10 +-
 drivers/gpu/drm/nova/gem.rs    |  11 +-
 drivers/gpu/drm/tyr/driver.rs  |  12 +-
 drivers/gpu/drm/tyr/gem.rs     |   3 +-
 rust/kernel/drm/device.rs      | 231 +++++++++++++++++++++++++--------
 rust/kernel/drm/driver.rs      |  56 ++++++--
 rust/kernel/drm/gem/mod.rs     |  66 ++++++----
 rust/kernel/drm/mod.rs         |   4 +
 8 files changed, 292 insertions(+), 101 deletions(-)


base-commit: 086714bbb96f63785da251e1f8d1ce3e716a6e42
-- 
2.52.0

