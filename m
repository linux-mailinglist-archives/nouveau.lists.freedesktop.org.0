Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BBE7B544E
	for <lists+nouveau@lfdr.de>; Mon,  2 Oct 2023 15:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C083310E2AC;
	Mon,  2 Oct 2023 13:50:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE39F10E2AC
 for <nouveau@lists.freedesktop.org>; Mon,  2 Oct 2023 13:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696254616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Nwx/VBvi2Ll0/8emzZfMoPpx/p+0CAxTL6gVB2JkPe4=;
 b=EdwmkXAhuMYAmQvda0CJyoP48Ajvixr20tCNHmIxrMkT0RjRFGl0Tl9HwoY82oGRTvgQHX
 peTxlcwDkTvI+uj7C3FzHmdhfY8NcHlxQQVEb2qDXgupIR7HIMqk/ReIRcFtsvVcqbp2g7
 /o2LhfyQtNWqNVtgwxRSnZhTIcLauPA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-yL1gUevkOWWbEgsfpxiF0A-1; Mon, 02 Oct 2023 09:50:15 -0400
X-MC-Unique: yL1gUevkOWWbEgsfpxiF0A-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94f7a2b21fdso127924766b.2
 for <nouveau@lists.freedesktop.org>; Mon, 02 Oct 2023 06:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696254614; x=1696859414;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nwx/VBvi2Ll0/8emzZfMoPpx/p+0CAxTL6gVB2JkPe4=;
 b=OW7pDTo1YFRY1xjrF7TNje/R5ue9gen9JCWvF1KVOECrx7Le2rdFEl7+cVea15SlPV
 USGIhhGSCEJHbipAGSQa4YIHTxxTC5KFYrT8zArdEGSCicMdC8+9McYRcz7fuXXwJ6ac
 gMfRaS1iIsV3yG2MQvc84upK6gU8dtjvDzos+HWDRJY7RuWxOAS8zKXKtQw9f+2/UbAl
 B9zY6xy4JTjK//FlwgMm2NPLCnxJQLZHgDocSGp513UgtLHjapcA2TCbm3avhNfaTptO
 8DotlV+RlhlgL9q+/DZHDkV7av7/3MKifaCR7A0c8EmTXJGzvGvLr4i9IKCbYKJqhbq5
 oWsQ==
X-Gm-Message-State: AOJu0Yyw3urt/U3zPtA2JXKsDEGaPLwHSScBhfI1lErbsC785T2Riyol
 YbaT8rZQc+2tx1XCnYl3H+cbL0iNIC85u9B4iIActCYUYtyH7dbqBk+TthajS6pG7KuwS4uA4AQ
 sJHUz3vN99N3lM7nynfbjHGCGKk63M0H3XS2YG9G6l16afavgCB8xpVH17xygurBcuPKpmQq9Jl
 eVbiPL
X-Received: by 2002:a17:906:109e:b0:9ae:41db:c27f with SMTP id
 u30-20020a170906109e00b009ae41dbc27fmr8638384eju.10.1696254614357; 
 Mon, 02 Oct 2023 06:50:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOyAk2A+5hPWVMwIvF1D2MQJJkYjnhQvamVR/gCygfPW4WM63DnADCGymABNWeANbu1hiwhg==
X-Received: by 2002:a17:906:109e:b0:9ae:41db:c27f with SMTP id
 u30-20020a170906109e00b009ae41dbc27fmr8638363eju.10.1696254613994; 
 Mon, 02 Oct 2023 06:50:13 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a170906050800b009934855d8f1sm16974238eja.34.2023.10.02.06.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 06:50:13 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org,
	faith@gfxstrand.net
Date: Mon,  2 Oct 2023 15:46:46 +0200
Message-ID: <20231002135008.10651-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH v2 1/3] drm/nouveau: chan: use struct nvif_mclass
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

