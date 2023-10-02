Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2884F7B5452
	for <lists+nouveau@lfdr.de>; Mon,  2 Oct 2023 15:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCDE10E2BB;
	Mon,  2 Oct 2023 13:50:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D900410E2B5
 for <nouveau@lists.freedesktop.org>; Mon,  2 Oct 2023 13:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696254631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Nbhk/39NZ1l6uBmAD3wSLQe9P3Plz1M/2g+jaVSYB0=;
 b=ZqQHdLcT8tvb36Q4c7LzlpfI/wM1asPpIp+qJTI4oQFVNheQ5xfqvRq7nXvX9bV68wuzwI
 r/Ut3nu/35fbJJ7+EcYPyy/E7RsTXQlQyFjjoEtMenIy5Z20ix8KmzZUrF8CClXMrxWOku
 68+1bxitgycrXxGUWuiyxp7mv2HfFU4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-_tWkQv31NbqjOoHA2NX8iw-1; Mon, 02 Oct 2023 09:50:19 -0400
X-MC-Unique: _tWkQv31NbqjOoHA2NX8iw-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-53342507b7fso12814992a12.3
 for <nouveau@lists.freedesktop.org>; Mon, 02 Oct 2023 06:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696254618; x=1696859418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Nbhk/39NZ1l6uBmAD3wSLQe9P3Plz1M/2g+jaVSYB0=;
 b=HSWPkCMXcoGt0t+AzQM4WDuNp8dg1EIE0TUGgAh5wSVTHij2bJwG8eCsJrvg9tY38C
 oWeiLKCBnwMOFLYNm0ljuVtVGb+NcgCmoeYgfvdDBsvogdfnm5lAlTweG3S95fHqiQMJ
 Y9jqHG/05KWlMOnHcUACNvZWIpDrWiNNGEu6ANCMWV37n/rThBhffP/GMYnKKOxm02D2
 N1ofHCJx8vH4GH9x3UHR4SIBaQ6GEqFawE+BHxIk2jtMD+sDfuQXVAStWdo128YryraD
 T6sm5uj58txoju+0nISXyPmA2vnzi7yZCWcfyRzLZGFpPISFTeHOcQjAKkvK9oWsjFfS
 IAGg==
X-Gm-Message-State: AOJu0YxK6figSAYK6UnI43KxHBQnik78Sp95iA4JpNKQnQAPf5bVpKiK
 O84kce6xqrAm13AZCc4cn7OYn4pW3wExNi+5zTs7GxHFsuS5MrkKO6ssaCFAKBcbIcdIZCLDDIi
 zQvOoksVODDxcLsWp4DXFzS5abXdNp4zgkQnD9CekyAvo3ixulCH27dZ1Hr+OhtiWGfDgyePPtm
 PNGE7O
X-Received: by 2002:a05:6402:1f0e:b0:530:7ceb:334 with SMTP id
 b14-20020a0564021f0e00b005307ceb0334mr11528608edb.3.1696254618568; 
 Mon, 02 Oct 2023 06:50:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd1NWIuOJNKo794dBiPjMLVNbO5xTqJg9iWglcHaQvaejWHQyVJof01QCvXoSO3BIM2RQpyw==
X-Received: by 2002:a05:6402:1f0e:b0:530:7ceb:334 with SMTP id
 b14-20020a0564021f0e00b005307ceb0334mr11528588edb.3.1696254618202; 
 Mon, 02 Oct 2023 06:50:18 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 cm15-20020a0564020c8f00b0053537ad3936sm7981444edb.21.2023.10.02.06.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 06:50:17 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org,
	faith@gfxstrand.net
Date: Mon,  2 Oct 2023 15:46:47 +0200
Message-ID: <20231002135008.10651-2-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231002135008.10651-1-dakr@redhat.com>
References: <20231002135008.10651-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH v2 2/3] drm/nouveau: chan: use channel class
 definitions
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

Use channel class definitions instead of magic numbers.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index dffbee59be6a..ac56f4689ee3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -442,9 +442,11 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 	}
 
 	/* initialise dma tracking parameters */
-	switch (chan->user.oclass & 0x00ff) {
-	case 0x006b:
-	case 0x006e:
+	switch (chan->user.oclass) {
+	case NV03_CHANNEL_DMA:
+	case NV10_CHANNEL_DMA:
+	case NV17_CHANNEL_DMA:
+	case NV40_CHANNEL_DMA:
 		chan->user_put = 0x40;
 		chan->user_get = 0x44;
 		chan->dma.max = (0x10000 / 4) - 2;
-- 
2.41.0

