Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3473A6D55E0
	for <lists+nouveau@lfdr.de>; Tue,  4 Apr 2023 03:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DDE10E1C0;
	Tue,  4 Apr 2023 01:28:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9DD10E216
 for <nouveau@lists.freedesktop.org>; Tue,  4 Apr 2023 01:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680571680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zKXKlpbqPz1zBDAc8gRMr7UD/43fGbZFIFAeWQ+/v+c=;
 b=PIAmDAIQyJKd+35TQfiCJ8ZDnypiDUggvDuYgWDzoLNgBaKFRFF2sN+y1DJzH1PKK6O2Eq
 GOHNAK9yZgtaO7V3kVg2iGNEn8+LCzhykb6fq62uxRyIvoIa7D1aZKFz5nBU9VT/kVJkc6
 jSeuRTaYV3EFvpTdAuK5y2qsVdl55rI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-W6V3kEGuN6u8g2Capaonww-1; Mon, 03 Apr 2023 21:27:59 -0400
X-MC-Unique: W6V3kEGuN6u8g2Capaonww-1
Received: by mail-ed1-f71.google.com with SMTP id
 c11-20020a509f8b000000b00501e2facf47so43804537edf.16
 for <nouveau@lists.freedesktop.org>; Mon, 03 Apr 2023 18:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680571678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zKXKlpbqPz1zBDAc8gRMr7UD/43fGbZFIFAeWQ+/v+c=;
 b=um3R2QiCbJaqiPAvmWmY1HD4H4S0Ro8+V5ux/E613FFE/YE3pN+0r7iJjsD8TFWP6e
 oJxnHJX64S3vn+U3+qKMgh5KYbjGAhaBYgla+fRRlPcE+/wbTuWYZELbQd/jcowwSsEi
 rH9R49Hwgvc+9edBOk86X3YHXd/7hQZpNaDwUSqtVYaDjIG/lO/Eh+hkcX8FgS/70Jlj
 SCPngDk0lfUJoRDKY6ZjrckPeHPaxYARNiuFwlW55d2oWseYkNKZsg3htwZ4LCUoG/AR
 EVUmjJAWc8pqX/Hs7oODJPNLV7FFrLGeYj562LwxiGORwOWiCoeDVlTjOM5NiobYFTEN
 8fXg==
X-Gm-Message-State: AAQBX9cCdpBgt/Ieo34HoWRg5zAbGt5tAzzkF3qbPS0g3D+JXM7hnkur
 NmnXu4pX9QPfm/djpZSqeEd6tDFrvsUC9rvuUVJPVYxaU4zzV9CoAAkErU2Yn8DCOe0ANhGITZl
 k58ad+ircUBk7Zm/B/iYdwapahA==
X-Received: by 2002:a17:906:3518:b0:947:f937:d58c with SMTP id
 r24-20020a170906351800b00947f937d58cmr399000eja.73.1680571678176; 
 Mon, 03 Apr 2023 18:27:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350YwVNPsPlkQRJTUmcCSFAR4UCs9dVRBPURJGBPqRf9UDK5ZqVStZ/XxLd5hu3kZ37jVcjG1Sg==
X-Received: by 2002:a17:906:3518:b0:947:f937:d58c with SMTP id
 r24-20020a170906351800b00947f937d58cmr398989eja.73.1680571677891; 
 Mon, 03 Apr 2023 18:27:57 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a17090665c900b0093fa8c2e877sm5158255ejn.80.2023.04.03.18.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 18:27:57 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Tue,  4 Apr 2023 03:27:29 +0200
Message-Id: <20230404012741.116502-4-dakr@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404012741.116502-1-dakr@redhat.com>
References: <20230404012741.116502-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v3 03/15] maple_tree: split up MA_STATE()
 macro
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Split up the MA_STATE() macro such that components using the maple tree
can easily inherit from struct ma_state and build custom tree walk
macros to hide their internals from users.

Example:

struct sample_iterator {
	struct ma_state mas;
	struct sample_mgr *mgr;
};

\#define SAMPLE_ITERATOR(name, __mgr, start)			\
	struct sample_iterator name = {				\
		.mas = MA_STATE_INIT(&(__mgr)->mt, start, 0),	\
		.mgr = __mgr,					\
	}

\#define sample_iter_for_each_range(it__, entry__, end__) \
	mas_for_each(&(it__).mas, entry__, end__)

--

struct sample *sample;
SAMPLE_ITERATOR(si, min);

sample_iter_for_each_range(&si, sample, max) {
	frob(mgr, sample);
}

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 include/linux/maple_tree.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index 1fadb5f5978b..87d55334f1c2 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -423,8 +423,8 @@ struct ma_wr_state {
 #define MA_ERROR(err) \
 		((struct maple_enode *)(((unsigned long)err << 2) | 2UL))
 
-#define MA_STATE(name, mt, first, end)					\
-	struct ma_state name = {					\
+#define MA_STATE_INIT(mt, first, end)					\
+	{								\
 		.tree = mt,						\
 		.index = first,						\
 		.last = end,						\
@@ -435,6 +435,9 @@ struct ma_wr_state {
 		.mas_flags = 0,						\
 	}
 
+#define MA_STATE(name, mt, first, end)					\
+	struct ma_state name = MA_STATE_INIT(mt, first, end)
+
 #define MA_WR_STATE(name, ma_state, wr_entry)				\
 	struct ma_wr_state name = {					\
 		.mas = ma_state,					\
-- 
2.39.2

