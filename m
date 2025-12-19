Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3056CCD20F6
	for <lists+nouveau@lfdr.de>; Fri, 19 Dec 2025 22:54:00 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0B55C10F0E4;
	Fri, 19 Dec 2025 21:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cit+AVP6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1F4D14563F;
	Fri, 19 Dec 2025 21:46:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766180785;
 b=KeI5Z7z7tcrzIZtEPukFldmYnzKnDR69pxaNOwCdMbPgtERlvv+j8NYOeg3qULnvk5Wp4
 BYJ86/BWNsu1yxCHkSGVQvKr5DQTkIKhGsuWDZEeufwEWZar+2RNt/6iG0+2CpxDwqGa5eX
 FVxenR58z65tLaDBk8u/KcyRm7oMN/xu7LIjA6EezND19qAGceptFbfZcVUidofo41LtmbO
 fPxWZOv8Bt1jCdYEATp9i9H+Lb4VkWBpBxwGmLG10DKjpketnFNObgConlrHaocB+YdaYPp
 O6CMJPeaSh27Ln1vMKqgTijDsqoZGb38gdLiYODZrGkjwsDOU49qc+ADpm+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766180785; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EAePM3QMKVvKj521+eJkpi020bYlRB7Q4CCT8RGJeHk=;
 b=OL64LTZFKY19W8O8TvwapQN+AljfhWcaLSufs0pfU1TC6Gqbub77got2uzBIxRpJisrke
 ueAXnJaxCl8oN9ud15Mk/na2S/9gVAg6KHg2ahrTxxrN1QFXz+hMX6RlyjBhSoEI9UUW9wQ
 GlVE2PInus1QWbyTlCK/NgeWba4wWNBfzhktlggjOyat8NhjsjCzQFb1EyV5KRdGg3/nnsU
 r6F4doD7WQkhJQw6nqMH+BwUjLfBss2/7gvf+QaQkbozSJqIgHDdV5LyuXtJqV3KucJ9Hzz
 kMszZ992AP09DufKAFOMRVcnTxK0sISjCbtscZqw1H32gWMG7VIX2P2IhIGw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C06F643F91
	for <nouveau@lists.freedesktop.org>; Fri, 19 Dec 2025 21:46:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 47AFF10F0E0
	for <nouveau@lists.freedesktop.org>; Fri, 19 Dec 2025 21:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766181234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EAePM3QMKVvKj521+eJkpi020bYlRB7Q4CCT8RGJeHk=;
	b=cit+AVP6rykfp18Y/8QmkUQrwZPScLH4y7NSw/az63lGaW/tKG9Az4wes3hOzubI+3Eug8
	6XapwC0rBKPaXMyaobThEbJbnBlE/33bBGcPXR/uLUNSR1gbTY9fekAX1R71WB0GhPZeBi
	l+y8QqwUlHcuWXRJxwzfV9if2Hpyxfs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-392-6PqoTe58OLiqfFYR7RLvIQ-1; Fri,
 19 Dec 2025 16:53:50 -0500
X-MC-Unique: 6PqoTe58OLiqfFYR7RLvIQ-1
X-Mimecast-MFC-AGG-ID: 6PqoTe58OLiqfFYR7RLvIQ_1766181228
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 61CB91955E7F;
	Fri, 19 Dec 2025 21:53:48 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.166])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D3CAB30001A2;
	Fri, 19 Dec 2025 21:53:45 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/nouveau: Fix cursor-related display hang
Date: Fri, 19 Dec 2025 16:52:01 -0500
Message-ID: <20251219215344.170852-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-ID-Hash: GH7JPGVWY7C5HQL3TCR25QGCAX7GF3CS
X-Message-ID-Hash: GH7JPGVWY7C5HQL3TCR25QGCAX7GF3CS
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GH7JPGVWY7C5HQL3TCR25QGCAX7GF3CS/>
Archived-At: 
 <https://lore.freedesktop.org/20251219215344.170852-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is a fix for one of the many issues I've been finding on my brand
new desktop. This one in particular is easy to hit if you have a cursor
with a continously updating surface between two displays, what fun!

Reminds me of a another bug from long ago…

Lyude Paul (2):
  drm/nouveau/disp/nv50-: Set lock_core in curs507a_prepare
  drm/nouveau/kms/nv50-: Assert we hold nv50_disp->lock in
    nv50_head_flush_*

 drivers/gpu/drm/nouveau/dispnv50/curs507a.c | 1 +
 drivers/gpu/drm/nouveau/dispnv50/head.c     | 5 +++++
 2 files changed, 6 insertions(+)


base-commit: 8e7460eac786c72f48c4e04ce9be692b939428ce
-- 
2.52.0

