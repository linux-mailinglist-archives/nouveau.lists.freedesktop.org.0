Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202787360A5
	for <lists+nouveau@lfdr.de>; Tue, 20 Jun 2023 02:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F5310E236;
	Tue, 20 Jun 2023 00:42:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B966C10E23A
 for <nouveau@lists.freedesktop.org>; Tue, 20 Jun 2023 00:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687221759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C9apoWPgHQ+HttjrVOmvMmvBAGzRpC/qILH8eE4EO5c=;
 b=DgqeOzxBh5hfGYhUrKmiQfs/vPhfg9pIkj+ROChGmK6lMQ87aQuz/pBPpCSycygA2/ISlw
 Fcf1V6xOF32CcFkvrDGK341n6qZok0GXhhDpd4PEaqlEQTESO0KT6qwzoPZlT77WvZ+tvQ
 LvKK5vnJVDMP8l9IXXZnHOZ8d3FQTLk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-AurlpU5EMsaBNNtiAY-hIQ-1; Mon, 19 Jun 2023 20:42:35 -0400
X-MC-Unique: AurlpU5EMsaBNNtiAY-hIQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-51a4a83d597so1752691a12.2
 for <nouveau@lists.freedesktop.org>; Mon, 19 Jun 2023 17:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687221754; x=1689813754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C9apoWPgHQ+HttjrVOmvMmvBAGzRpC/qILH8eE4EO5c=;
 b=laHfRKeXSKeT8FgiWa/giycTQl07aKlqXC7pKpQw/Il4FewLviVO/T0Tm/ydsEwhVJ
 TgLbVkbvc5KJaXTZtL7vO3T1T6dB0POgDV8EfKHaoznFC5f68ofNvL3cEsr+ulx2rCGb
 w2sCqzMpCku/RwIWiaRnX7s2lD39k0P0JaD98XD3mVmOb7YXEU5Zq4u4Vy8bfF+NcygU
 1w2LqnsrVjyaN4gcGDWjDbJHG4Yn+GQ7bX3nbUGSmWjWC6Fzv15CiiW+3bqZ8PfHC56K
 1OmfwyxwhUb6rbdYBsPi6ZYLDZDS2p+/TxH6MMqX3gX4sA49G271R70unfZSIfbn28P3
 H8RQ==
X-Gm-Message-State: AC+VfDy0TOvcU3KmzlpyXXKzF6j0SESHLarD06C5KzLKcQDur2cL2F6H
 JKd1a8hDsEdz8Nry1HcEc+7QGfwXI9XocTX+1gmMwV0FVu2ahBB6RzkQftnfvTUs7BLah0lfKtM
 wUOGY6RhuHOtqxV/atk9T4tbsCA==
X-Received: by 2002:a17:907:3e0a:b0:8b1:7de3:cfaa with SMTP id
 hp10-20020a1709073e0a00b008b17de3cfaamr11230762ejc.3.1687221754044; 
 Mon, 19 Jun 2023 17:42:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7CuI4jncrqThsJCOY9EL8v0SHvOVlwMCpxRyLtkLTLUI18H8CeggEpcXJgjnduPuXIFRYrhA==
X-Received: by 2002:a17:907:3e0a:b0:8b1:7de3:cfaa with SMTP id
 hp10-20020a1709073e0a00b008b17de3cfaamr11230750ejc.3.1687221753916; 
 Mon, 19 Jun 2023 17:42:33 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a17090603d000b00986e6a7d230sm377729eja.168.2023.06.19.17.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 17:42:33 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Tue, 20 Jun 2023 02:42:05 +0200
Message-Id: <20230620004217.4700-3-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230620004217.4700-1-dakr@redhat.com>
References: <20230620004217.4700-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v5 02/14] maple_tree: split up MA_STATE()
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

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>
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
2.40.1

