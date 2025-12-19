Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88629CD2102
	for <lists+nouveau@lfdr.de>; Fri, 19 Dec 2025 22:54:04 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 45A8310F0EA;
	Fri, 19 Dec 2025 21:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="B8dJl8R5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6283245642;
	Fri, 19 Dec 2025 21:46:29 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766180789;
 b=uQ8CLorwdFp+La8UOUEJeaHxuAtm2E4f3tv1YsoynRX3rwJTpd+Cx7MJLH0o5EK8TDDQP
 99zTsu2kET/L/TwvJ1XKf/dYSQfTYeyteFH2j50++iRpKhW+smBU5AiZWBAbYWEHE+MDjyn
 MNa1zaCkD3/e5ufG37aEvONU4Z5XD4XQJePX08ROaJdCRp6boNQCcI/OqY0VE/hi/PASvwL
 2fIgZvBlHAgTcU/6Gt/MbThGz/W0QpL6NpnJATXcwHULYIT3XbJyruMzdM2eJ5zsNWKGpod
 kZ9bXa4TgL6OHHXgc1nDTxP7XUmN4cjZ62Ss+uSFQdAuUROcRpuPXizdksGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766180789; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=rkXEdzkbRQECKf+aADUpL9UrjM7M5Y0Z71t+7qrFeC4=;
 b=qHV3XTUM+qoL4sl9MmIzGKDvvY3Mo50yHvP+ck8errK5he9e++JHnFYGA6VMCgIR8GFCe
 +cgg6baaM+/Yxq4YYdRosGGEcKDfXiT3qUXMciQLNQW8hFcVkwXIstkMtEQF5L1qFPIp6DD
 im3rFgYmD9UVj0KFioLphcPwG66xf2GbUFQldPYaN8fdpfTa5L9qUwTvPWXmQoXQb62HcJW
 Dmqf2jqZaC234jKG10+W1ebhLn7xvroJrOsGrjBQys9pr4vfGLisCAFITHixieKxKpP5szW
 cgcPnViJvAGQzVZbkSoJe3U4DVMWP8zfQozyjWzoOKC5hbJzrs9+zeWWGa4A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 65A6143F91
	for <nouveau@lists.freedesktop.org>; Fri, 19 Dec 2025 21:46:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E92EF10F0E7
	for <nouveau@lists.freedesktop.org>; Fri, 19 Dec 2025 21:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766181239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rkXEdzkbRQECKf+aADUpL9UrjM7M5Y0Z71t+7qrFeC4=;
	b=B8dJl8R5a5QAqvoiPFfgpva4pYL4fGMjqYwVsjpwNVpyoIzJJw55ERE1gQ537zB3f+1Die
	ewWk6NUGyX1kq/hCkFXGDSLIojUfaPLtly1EJsD4jdNhRk+ImZzZV4jtU4k8So1XI8ja7E
	TmuVfPUE3G8bazD82/jqYrRDXVhQkm8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-207-LGR_lSpcPTmR4GwMKFkHxA-1; Fri,
 19 Dec 2025 16:53:53 -0500
X-MC-Unique: LGR_lSpcPTmR4GwMKFkHxA-1
X-Mimecast-MFC-AGG-ID: LGR_lSpcPTmR4GwMKFkHxA_1766181232
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D72D21956094;
	Fri, 19 Dec 2025 21:53:51 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.166])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B027730001A2;
	Fri, 19 Dec 2025 21:53:49 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/nouveau/disp/nv50-: Set lock_core in curs507a_prepare
Date: Fri, 19 Dec 2025 16:52:02 -0500
Message-ID: <20251219215344.170852-2-lyude@redhat.com>
In-Reply-To: <20251219215344.170852-1-lyude@redhat.com>
References: <20251219215344.170852-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-ID-Hash: 6YPOTOMUQSATR54AWHG35EIZLEYNMPG5
X-Message-ID-Hash: 6YPOTOMUQSATR54AWHG35EIZLEYNMPG5
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: stable@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6YPOTOMUQSATR54AWHG35EIZLEYNMPG5/>
Archived-At: 
 <https://lore.freedesktop.org/20251219215344.170852-2-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

For a while, I've been seeing a strange issue where some (usually not all)
of the display DMA channels will suddenly hang, particularly when there is
a visible cursor on the screen that is being frequently updated, and
especially when said cursor happens to go between two screens. While this
brings back lovely memories of fixing Intel Skylake bugs, I would quite
like to fix it :).

It turns out the problem that's happening here is that we're managing to
reach nv50_head_flush_set() in our atomic commit path without actually
holding nv50_disp->mutex. This means that cursor updates happening in
parallel (along with any other atomic updates that need to use the core
channel) will race with eachother, which eventually causes us to corrupt
the pushbuffer - leading to a plethora of various GSP errors, usually:

  nouveau 0000:c1:00.0: gsp: Xid:56 CMDre 00000000 00000218 00102680 00000004 00800003
  nouveau 0000:c1:00.0: gsp: Xid:56 CMDre 00000000 0000021c 00040509 00000004 00000001
  nouveau 0000:c1:00.0: gsp: Xid:56 CMDre 00000000 00000000 00000000 00000001 00000001

The reason this is happening is because generally we check whether we need
to set nv50_atom->lock_core at the end of nv50_head_atomic_check().
However, curs507a_prepare is called from the fb_prepare callback, which
happens after the atomic check phase. As a result, this can lead to commits
that both touch the core channel but also don't grab nv50_disp->mutex.

So, fix this by making sure that we set nv50_atom->lock_core in
cus507a_prepare().

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 1590700d94ac ("drm/nouveau/kms/nv50-: split each resource type into their own source files")
Cc: <stable@vger.kernel.org> # v4.18+
---
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
index a95ee5dcc2e39..1a889139cb053 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
@@ -84,6 +84,7 @@ curs507a_prepare(struct nv50_wndw *wndw, struct nv50_head_atom *asyh,
 		asyh->curs.handle = handle;
 		asyh->curs.offset = offset;
 		asyh->set.curs = asyh->curs.visible;
+		nv50_atom(asyh->state.state)->lock_core = true;
 	}
 }
 
-- 
2.52.0

