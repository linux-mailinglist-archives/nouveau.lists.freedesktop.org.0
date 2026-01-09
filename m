Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C01D0BA59
	for <lists+nouveau@lfdr.de>; Fri, 09 Jan 2026 18:30:31 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B239710E914;
	Fri,  9 Jan 2026 17:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mary.zone header.i=@mary.zone header.b="Q5Iv7Qfr";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 55F0B44C97;
	Fri,  9 Jan 2026 17:22:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767979325;
 b=DoXhLBDAIsjizTcDtcL8UgHelA624nbxZVvnjht9YdguVLDy4fidmtYybJB0mZnx4h7F9
 efB6PX929XzJUzhUq/1yQTWdSPCIs3dXrnFB7gyRARGRW7JCsfaTJxzeDNHui+k6Fkm/CfS
 bPXH6eP2jMiD/LT3EWGMygzGdMO9li81i4/fm63rgGCVdAyZ4pOhebhfYhG72asbJQrJ7qK
 rXZvif9Bjo8OipNeoxCBO7cACSEkAp9JnKHpM19PixUAX3kd4/eba9K5MkLYR5++WgR6tSt
 3GVCYwygxvoz0Aqi8MlADMZJJeYzdwnfQN3LRge1fhBPCixHskhIC/I0maYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767979325; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=elZC+OpWvMiao47yhMKfmzrUQTBNeJ6lH9L5GUb402I=;
 b=on37vdCu5OcJ8yLpWKEYYGKPdAkh9k+RvXp3C8ZStz3oCZx2qq0KvGSWZsd52BIDsjP0A
 /ovMLathPKU4Iv3fMfun3iBaXQmFgGMsWo0VxuPZwsxmpvy9aYCxzDUdX92WZmCR3YnPaRz
 rTSlyAR/ahGWmAh4caEBbTTwr70evKnizQRRqXd2BoydTu9bOA0K3LgjrTtUEmSnT2C2GRT
 HTllvqxLVlY3+mrUijDBY6T3f1IIJ4hBobJoaAFXIes6RyUr0zhZUunOUMs+11SfJq9pKSr
 kodHrCl3xNJHx33Kv/M8YOpGNheZbusRQ94l+Tpt4cyLjlWDxcmgGYIV0mNw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=mary.zone;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=mary.zone;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E281344C3C
	for <nouveau@lists.freedesktop.org>; Fri,  9 Jan 2026 17:22:01 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F2D7710E90E
	for <nouveau@lists.freedesktop.org>; Fri,  9 Jan 2026 17:30:21 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b7277324054so811917766b.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 09 Jan 2026 09:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mary.zone; s=google; t=1767979820; x=1768584620;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=elZC+OpWvMiao47yhMKfmzrUQTBNeJ6lH9L5GUb402I=;
        b=Q5Iv7QfrVKjJWL2O+x4bziBeuxaARi/uT64uQdn5NAq8QKvmYGHj+HK/fK0Bw6gL54
         CDLJX/fUFAdPbQqIy3YvZwOLnk+l72XXhCgKtJHkDAC2Q9b+1Bhr6wnXfhUkuRm0t8dB
         sh39w/YRD7edFSFonI1Xkjps+ShihtqLiHGXE96khjHL+MqTqebZjebUpoFT9vehOQwu
         izLc9zMQMz6mj0l2u345IO6GrhJKvJaIjlCwlGHvE1dTm48xDDnFL+IoN/vQBxa8iKhC
         iQsZhlc2pOlEEibvjaQyEpV7U7p6qn99S3H9JaN42hxv46RGriFWR1EVSrp6zNJZzxDN
         kFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767979820; x=1768584620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=elZC+OpWvMiao47yhMKfmzrUQTBNeJ6lH9L5GUb402I=;
        b=tWD/P3C9fn9EghyixvZjawHbi1N+xMpc9M14HsThSYYf5d5Ly/G2PN0e5/7+XxzRmz
         1WLfJvSIjdDeBFv9Rd8lVapNc3/HV1F+FBvR7veftKGBZj1TBcacY9AZDEFW7b6DBi+D
         lnUZcgkxOR/pfpOquTe5KecT9H8GEimx5da7UXxsp3jywrdTnlY7SD9M1upO2Zs0RUA6
         BAEXv6LZwOny4GYyA6ohIKUYuDFIBzMqpRqE5hgTydF3d098tGrpN4EMrtkNwWl7St4y
         2I3LXOlo3SBk5dKUAwlJcQ8pSEY+P1CfX2SiKjpvsi1qgSN+X6tBW8H9MkoktcmoCz2a
         UQJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgsWG7k2UDx/gF9pZoKM+1e1EZ7CIMuK4+06791ni1qteHjSiMYMtwhQN9zLTZTdC1tjxtivS0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUjvgZFImAku9LWpY9imBVr3jggXiv+8V0My2ozZAPU2aPsJ//
	1lkpoAExF7lnVL8BjNE7kuvHKVg0i49/UlcPYGaCNxpZABsHmYxfuQo3i47fGcOhBbc=
X-Gm-Gg: AY/fxX6DKH+jcS2JHrvt5YyDkaM9UNCZiYE/oA/iuzNA2+QS6eU+FaCtsglZI80ziix
	QtG0cmk4+7lnPJLztnIcn9gYKPBrWt1VTDcuB8DC7SR6Vq5FzTx3P+zV3c2dwlHauhItSSLwNHW
	ZDo5bwuHM7uKtba7trk+T9mEU3y/Thhiq8iCey2XXmXLacXZek7udJ6J2OPGwccFH4ABKVQmNay
	0U2MhNxH/dGnVnrT6+9zSRQuQztCmBnMP3MDNFTiBct+eiZYSGyHtLpzMwY/qrF2Xg73eXiOgoJ
	kOnbOHpCxVGzsBbqggCHVvz5lkdunTN2m69EI6LRIXk6lIicSOfG5lDOkYoXIMFUSJCUzHGBmmK
	SV/haVpUVmm5RcgW+trUU41UCn8vq+wjedoqPfpCHMJazbDmiVvchAs7Q1DIxYuBkIMCXELWJUY
	Js++7gOoVUFc6G0mdOlBWRfvBqzstCULci9hfL6GHYktGhnikXdXiuVng/GHbaRLlYZZFKnE0=
X-Google-Smtp-Source: 
 AGHT+IEYiFQaO2dhDZqmH9t7iNpy+GLxla8nCF9CHBGFTiZHm/wAyRIa7gXAFdArBNItEHmS/LcEwQ==
X-Received: by 2002:a17:907:1c82:b0:b83:972c:77fe with SMTP id
 a640c23a62f3a-b84450332aamr1052665066b.2.1767979820236;
        Fri, 09 Jan 2026 09:30:20 -0800 (PST)
Received: from [192.168.1.42]
 (2a01cb0405e83a000cb38cfe29807c1e.ipv6.abo.wanadoo.fr.
 [2a01:cb04:5e8:3a00:cb3:8cfe:2980:7c1e])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a230db0sm1195426266b.2.2026.01.09.09.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:30:19 -0800 (PST)
From: Mary Guillemard <mary@mary.zone>
Date: Fri, 09 Jan 2026 18:30:10 +0100
Subject: [PATCH 1/3] drm/nouveau/chan: Store channel allocation details in
 nouveau_channel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-nouveau-gpfifo-increase-v1-1-ed0be9822878@mary.zone>
References: <20260109-nouveau-gpfifo-increase-v1-0-ed0be9822878@mary.zone>
In-Reply-To: <20260109-nouveau-gpfifo-increase-v1-0-ed0be9822878@mary.zone>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
Message-ID-Hash: ZKDDC47JFYRMQOTBO52EPKLQO32VFZBP
X-Message-ID-Hash: ZKDDC47JFYRMQOTBO52EPKLQO32VFZBP
X-MailFrom: mary@mary.zone
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mary Guillemard <mary@mary.zone>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZKDDC47JFYRMQOTBO52EPKLQO32VFZBP/>
Archived-At: 
 <https://lore.freedesktop.org/20260109-nouveau-gpfifo-increase-v1-1-ed0be9822878@mary.zone/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Previously, nouveau_channel_init was hardcoding offsets and length
for the internal pushbuf and GPFIFO entries details.

As we are going to extend the size of the GPFIFO ring, we now store
those information in nouveau_channel_ctor and use those when creating
related NVIF objects for channels.

Signed-off-by: Mary Guillemard <mary@mary.zone>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c | 20 ++++++++++++--------
 drivers/gpu/drm/nouveau/nouveau_chan.h |  3 +++
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index b1e92b1f7a26..b646212a34b3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -293,6 +293,10 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 	if (ret)
 		return ret;
 
+	chan->push.plength = plength;
+	chan->push.ioffset = ioffset;
+	chan->push.ilength = ilength;
+
 	/* create channel object */
 	args->version = 0;
 	args->namelen = __member_size(args->name);
@@ -311,8 +315,8 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 			args->ctxdma = nvif_handle(&chan->push.ctxdma);
 		else
 			args->ctxdma = 0;
-		args->offset = ioffset + chan->push.addr;
-		args->length = ilength;
+		args->offset = chan->push.addr + chan->push.ioffset;
+		args->length = chan->push.ilength;
 	}
 	args->huserd = 0;
 	args->ouserd = 0;
@@ -437,22 +441,22 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 	} else
 	if (chan->user.oclass < FERMI_CHANNEL_GPFIFO) {
 		ret = nvif_chan506f_ctor(&chan->chan, chan->userd->map.ptr,
-					 (u8*)chan->push.buffer->kmap.virtual + 0x10000, 0x2000,
-					 chan->push.buffer->kmap.virtual, chan->push.addr, 0x10000);
+					 (u8 *)chan->push.buffer->kmap.virtual + chan->push.ioffset, chan->push.ilength,
+					 chan->push.buffer->kmap.virtual, chan->push.addr, chan->push.plength);
 		if (ret)
 			return ret;
 	} else
 	if (chan->user.oclass < VOLTA_CHANNEL_GPFIFO_A) {
 		ret = nvif_chan906f_ctor(&chan->chan, chan->userd->map.ptr,
-					 (u8*)chan->push.buffer->kmap.virtual + 0x10000, 0x2000,
-					 chan->push.buffer->kmap.virtual, chan->push.addr, 0x10000,
+					 (u8 *)chan->push.buffer->kmap.virtual + chan->push.ioffset, chan->push.ilength,
+					 chan->push.buffer->kmap.virtual, chan->push.addr, chan->push.plength,
 					 chan->sema.bo->kmap.virtual, chan->sema.vma->addr);
 		if (ret)
 			return ret;
 	} else {
 		ret = nvif_chanc36f_ctor(&chan->chan, chan->userd->map.ptr,
-					 (u8*)chan->push.buffer->kmap.virtual + 0x10000, 0x2000,
-					 chan->push.buffer->kmap.virtual, chan->push.addr, 0x10000,
+					 (u8 *)chan->push.buffer->kmap.virtual + chan->push.ioffset, chan->push.ilength,
+					 chan->push.buffer->kmap.virtual, chan->push.addr, chan->push.plength,
 					 chan->sema.bo->kmap.virtual, chan->sema.vma->addr,
 					 &drm->client.device.user, chan->token);
 		if (ret)
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index bb34b0a6082d..9839de8da985 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -29,6 +29,9 @@ struct nouveau_channel {
 		struct nouveau_vma *vma;
 		struct nvif_object ctxdma;
 		u64 addr;
+		u64 plength;
+		u64 ioffset;
+		u64 ilength;
 	} push;
 
 	void *fence;

-- 
2.52.0

