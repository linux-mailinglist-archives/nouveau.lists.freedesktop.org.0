Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 828687AF7A7
	for <lists+nouveau@lfdr.de>; Wed, 27 Sep 2023 03:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E7F10E458;
	Wed, 27 Sep 2023 01:23:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E727510E456
 for <nouveau@lists.freedesktop.org>; Wed, 27 Sep 2023 01:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695777791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Nwx/VBvi2Ll0/8emzZfMoPpx/p+0CAxTL6gVB2JkPe4=;
 b=cjrJYcTL5zaR8mbqPJ0hB+5MXwAN1KiShvddZCBLExL0VI6wg63egMfVo7qRF3KEWB2A4+
 TqoxWt31CAw9YJMAgh3HvISmyZMktguPLJxw1bvYjUJa4XI01IDEehKVuJ5FK+wcN3gz74
 uYnOUHtHBlIITRb7wEMtyiOhwoWZflk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-eHlDbo4-OQCBFqHjF6HLkg-1; Tue, 26 Sep 2023 21:23:09 -0400
X-MC-Unique: eHlDbo4-OQCBFqHjF6HLkg-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9a681c3470fso810964566b.1
 for <nouveau@lists.freedesktop.org>; Tue, 26 Sep 2023 18:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695777788; x=1696382588;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nwx/VBvi2Ll0/8emzZfMoPpx/p+0CAxTL6gVB2JkPe4=;
 b=OkcmCdDhoe1dMjs2xYEplJHfTBnNHSjNR2Rsqo7WEcaQ+V7ltw14/0kfKXLbvooD27
 RPhkSczAtsRvslpSjHh8aoP5jGZLJWD45Dx9rSiAactNlgSBM6HBwMymThdchXlIixcz
 JtJaFo9bCE7HEh6nYvpE+2EHt+VPu6cSC00C+9nZGmhcJh0dzGt8eU98kkGZROdguMGj
 mLziWF9kY+j7q6DSc2uRH2lVq0JE1Z825VCUIHGF3MX9RkXd/20OSnrz4TPPajoeWfFr
 uGtOWeZQgQnfNgFWgezks7hkRnKMKiIbbgfgynUUwCaLNO5SotO5H4SyUY40q0pUQ0Xa
 I9bg==
X-Gm-Message-State: AOJu0Yw8YRzHpVjwjm8vW+hXMd/2VBLzuCVT5guY93PFu55/LvATU4ia
 t4u9Ys1fHbFeJ09Xp6uSKCPSuxTqUEXFe70QLilohRfjUTYr1CEvFan96tuZxWYQQdBKejriqDX
 WA04g5rskOGgnrMWILZ3/5wsFQCNLHLzl3GkSGkNR1apUdz45wLj0MdtsyDfc4umz4EqfTQmido
 4TNncP
X-Received: by 2002:a17:906:29c:b0:9ae:47c3:35a0 with SMTP id
 28-20020a170906029c00b009ae47c335a0mr260788ejf.47.1695777788201; 
 Tue, 26 Sep 2023 18:23:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVMdOKD/X10hbOpH6qcKZOGTxacseYAaLyIaQaR5KVR5ivd9rAbFGjG2CYVzJSQkZfrIfdBQ==
X-Received: by 2002:a17:906:29c:b0:9ae:47c3:35a0 with SMTP id
 28-20020a170906029c00b009ae47c335a0mr260774ejf.47.1695777787846; 
 Tue, 26 Sep 2023 18:23:07 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 rp13-20020a170906d96d00b009ada9f7217asm8429551ejb.88.2023.09.26.18.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 18:23:07 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org,
	faith.ekstrand@collabora.com
Date: Wed, 27 Sep 2023 03:22:51 +0200
Message-ID: <20230927012303.23525-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH 1/3] drm/nouveau: chan: use struct nvif_mclass
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Use actual struct nvif_mclass instead of identical anonymous struct.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 1fd5ccf41128..dffbee59be6a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -259,10 +259,7 @@ static int
 nouveau_channel_ctor(struct nouveau_drm *drm, struct nvif_device *device, bool priv, u64 runm,
 		     struct nouveau_channel **pchan)
 {
-	static const struct {
-		s32 oclass;
-		int version;
-	} hosts[] = {
+	const struct nvif_mclass hosts[] = {
 		{  AMPERE_CHANNEL_GPFIFO_B, 0 },
 		{  AMPERE_CHANNEL_GPFIFO_A, 0 },
 		{  TURING_CHANNEL_GPFIFO_A, 0 },
-- 
2.41.0

