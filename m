Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27454A36C77
	for <lists+nouveau@lfdr.de>; Sat, 15 Feb 2025 08:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC3310E181;
	Sat, 15 Feb 2025 07:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YTN/HZ2J";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD08110E183
 for <nouveau@lists.freedesktop.org>; Sat, 15 Feb 2025 07:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739605097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9SPJu0ZBIiiVkYEwkjayrxT/oy/c7Iuvd5fIj5BIhro=;
 b=YTN/HZ2JRUgoiwan/uolT3/axdZHXZScuBGo4TWI+q+CILKvGQWrDqcmpSjKFyoCbCpJUE
 bMAWOLYEqY82EorVagm5oz9KVGYcLVn5CJMuhEEgFwZOh9RtgXwReb828onOP4mXwI8t9i
 Cy/Gex0tniysI4tQsLgy/tbKJcfAsAo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-kncOQiUtPkKZvDCK1b_m_Q-1; Sat, 15 Feb 2025 02:38:15 -0500
X-MC-Unique: kncOQiUtPkKZvDCK1b_m_Q-1
X-Mimecast-MFC-AGG-ID: kncOQiUtPkKZvDCK1b_m_Q_1739605095
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5deb766de79so2615358a12.3
 for <nouveau@lists.freedesktop.org>; Fri, 14 Feb 2025 23:38:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739605094; x=1740209894;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9SPJu0ZBIiiVkYEwkjayrxT/oy/c7Iuvd5fIj5BIhro=;
 b=VrMPqIDvZcW466SbHdgK6XfjGguQgmyMiCwL68C2FpFgcf/uPg4G2ZcuElSeBuZyt2
 z8P0uPIu4rapuefTBvA3EhYxmXsqMBwZHuQ5BKtKFqjzMgISR8ttgN7/GrsEEm3+Xg7Q
 oW7ZTMXXYLKMZ5j1iIXYnDQCZitu1yfxbfR1kRA5SuZCI9757XoC70MZuLN3xl9w8YHt
 hF2yfGL/3PDj492xbef4o3eCo8oaYQgcFSJjIcRB33Nv2TF7Aj+/XyVUbJ1waHI7LEke
 kaMtBZiCNh8HvR9hVxrUNHRBklcWJhb8iuluwbfr5IxKQSBF0wraVx2qN7+jhj+Ov94z
 dsQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsZNnAdizYUHx0fAu4kRCzDkfFWICWf0HMpGDytKRugAWX2HM25VJsHkBlPi1lv7vlqLRCqMMc@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpDo4tQyZrDnzwG0FuRclVRI/z2VuGWt40VuEmpTzFJfytgp3d
 CInJ2mHOqER18lfXd9UvjMAvkndL6x0LFOVVbvpdYEEj9xpJ/DZvcx3Av1fBLOunrq7fboZhWul
 /f7e1V1yKvuQ10XfgMoKgeVRiim6QvH3Maa5Ji3K3jjUyzVTze5F88V/WXAaaekI=
X-Gm-Gg: ASbGncvlbfT96kn1qLNgPya2mMrlSbvVLOooeTwv53uF9WHROAV5TqlHzW14pRK9Mq/
 MI0MqMUQd7Uk97EtqKLjT3c3pP7dUDD/4bgiXTiSe20lgX42Ywp9iq+YBDdNRWgGknKET/UOJ8s
 i1VZORZ7z3dYWZqHU+Na6dT8g3Una54dIYBxOeVJYpcq63VPOUUAA10AnP7o5UNT9wbDSCyHe+L
 n3PEvq4hiUHnqSYffQ5WyuykV3tslzx9QGvVBdDP9Gdik7iNZ0c4fc2g75SIRmcpu/kMzebDsCD
 Ljo=
X-Received: by 2002:a05:6402:1ece:b0:5de:aa54:dc30 with SMTP id
 4fb4d7f45d1cf-5e0360441bbmr1752477a12.5.1739605094578; 
 Fri, 14 Feb 2025 23:38:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFHAhvVe5Py0hdiB94bUaSN07AMDxg4HYAot7e2ntkAqpIGaEmu0Phl9/Q2zVhnBH9f47G6g==
X-Received: by 2002:a05:6402:1ece:b0:5de:aa54:dc30 with SMTP id
 4fb4d7f45d1cf-5e0360441bbmr1752458a12.5.1739605094200; 
 Fri, 14 Feb 2025 23:38:14 -0800 (PST)
Received: from kherbst.lan ([188.192.20.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ded69e7c33sm3195322a12.61.2025.02.14.23.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 23:38:13 -0800 (PST)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Karol Herbst <kherbst@redhat.com>
Subject: [PATCH 0/1] Me stepping down as a nouveau kernel maintainer
Date: Sat, 15 Feb 2025 08:37:52 +0100
Message-ID: <20250215073753.1217002-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8g6kxnSka7YkHajTZ_Cr3HUXJ1gIuml22ktF7LtePCE_1739605095
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

I was writing this up on Wednesday night, chatted with a few folks about
it. A lot of things have happened. I often thought about at least
contributing some patches again once I find the time, but...

Anyway, you'll find a full and proper statement in the patch itself. And I
wish everybody the best of luck and all the strength needed.

Karol Herbst (1):
  MAINTAINERS: Remove myself

 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

-- 
2.48.1

