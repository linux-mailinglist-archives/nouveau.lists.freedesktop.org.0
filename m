Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C89A2F8CB
	for <lists+nouveau@lfdr.de>; Mon, 10 Feb 2025 20:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A684C10E393;
	Mon, 10 Feb 2025 19:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Y1sB74H+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9E610E393
 for <nouveau@lists.freedesktop.org>; Mon, 10 Feb 2025 19:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739216295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sqeXk3kyzFMqBsxEiyyOZegmX6HzmCNZGUJC3XQma+8=;
 b=Y1sB74H+lLXHynIowQPEBxX4frA5Jo6hSg79U4+CgdJq4Hn7P9Ol1YOmmx2QKQ6pQVWTFa
 VWt5fwzyvZ3KwIULs6fni3H3Zj7qYs3lL+IwvB2JC8mGLqWNs8rllUFdjLxuR8BvtX/Mrm
 /OjgwD3XkMQE3YWtXk27uCIoom2zzDw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-VZ98ekNsOnqYGTCd4OWj0g-1; Mon, 10 Feb 2025 14:38:14 -0500
X-MC-Unique: VZ98ekNsOnqYGTCd4OWj0g-1
X-Mimecast-MFC-AGG-ID: VZ98ekNsOnqYGTCd4OWj0g
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4394b8bd4e1so3393105e9.0
 for <nouveau@lists.freedesktop.org>; Mon, 10 Feb 2025 11:38:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739216293; x=1739821093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sqeXk3kyzFMqBsxEiyyOZegmX6HzmCNZGUJC3XQma+8=;
 b=gh5NBoozmoivjd7BCNJuhUxsWmTwXzNnSug6bNb+FKXV77X8dcQIOmyhfQylr0Jf+9
 GMDYGn20/xI6B5GwLrToItfa3oGdrz6ys0GjOhW/gTkgcFE6lpju2qist5hWwm7z7v5m
 hY6dpTRf/z3v55T2fO+9pNKHU2hrHQadvM9HF1toMnefKxYCJ5jViXTHBqt+aIvrAsFY
 NT9/YlS+MqHVHZ0Qu4pf3RphMtsoc6GyAW0ueNeMdzwkoe+v3mDaab5aN7QUmY9JGczI
 PRSaPscSJJD7KzkJAhxTjqlWgRnXgRw92/qhN5DeRztjpTwipNv1JGu+LersrWUdyJQj
 UxgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI831KkzuGzCpKy/W60y2kllBRKfaolkTKf0sDHZjG2rXoiZN+LSW29sp7IZQSrtT1nO5SiLm/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyspN0WZigBxQQcogrjPWjEnS2L/5sW43ccepeF3WY+H/FzVJOF
 dCfVik1A0NrYlUL0kg62XKcZ/K1gfu/hNVDzvFuXEpYS3GN4KNG/HwhG2tnEza07nGlwjqvhgt0
 pXvZLmyOAPhfxTNQ7K09Z8UI2qrKQSPxmrNNm1lSMgnbwl7igFfhdbHS1ZW+wkkQ=
X-Gm-Gg: ASbGncsvFFW19miZROgClobSWmz4QyY4M0qUcESx2TLU4ttFuFo3/a6a1BaeKWtfdnf
 y2Mkni1UOZy57G2YYYwvffZKPBn1MTdcPM3dEmSZA4b8/Ab5XOOKTETwCnaAn3piAeuA8vWR5w1
 P06Vd33UPxofXnqV8W5zL4gSEDq9XXIKP1Rr8+q6VHM3e8nL0DnJ2rA6UbvGl3xerJplht6kxDZ
 SLlILXRd1RuooKwJpU4cJ1eLdnv8z6koePIDRUmiC1udwrGJEkUZXP1O+rpDMxDpzaC22/6ZcGP
 +erCY++gDIjUkY06U580Zl1jc8SDrnfOs8XKdV+DHs/SbBRIP9Z9096EWjLm6iikdQ==
X-Received: by 2002:a05:600c:34c4:b0:439:4b9e:461b with SMTP id
 5b1f17b1804b1-4394b9e47dfmr21358225e9.14.1739216292950; 
 Mon, 10 Feb 2025 11:38:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFz4p8WiTgagZxwnDzZ7MmocZCF9a1hUwQMJIvxH3cH5x6X+HJSMDirq9gM71FmkI7KhAXcpA==
X-Received: by 2002:a05:600c:34c4:b0:439:4b9e:461b with SMTP id
 5b1f17b1804b1-4394b9e47dfmr21357855e9.14.1739216292555; 
 Mon, 10 Feb 2025 11:38:12 -0800 (PST)
Received: from localhost
 (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de.
 [2003:cb:c734:b800:12c4:65cd:348a:aee6])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43947bdc5c4sm26937995e9.23.2025.02.10.11.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 11:38:11 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 damon@lists.linux.dev, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, SeongJae Park <sj@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 stable@vger.kernel.org
Subject: [PATCH v2 02/17] mm/rmap: reject hugetlb folios in
 folio_make_device_exclusive()
Date: Mon, 10 Feb 2025 20:37:44 +0100
Message-ID: <20250210193801.781278-3-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UeWW2aXdbKjLfsQxo5gPYhU2rMEda5ndiM-vaIGU4Yk_1739216293
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

Even though FOLL_SPLIT_PMD on hugetlb now always fails with -EOPNOTSUPP,
let's add a safety net in case FOLL_SPLIT_PMD usage would ever be reworked.

In particular, before commit 9cb28da54643 ("mm/gup: handle hugetlb in the
generic follow_page_mask code"), GUP(FOLL_SPLIT_PMD) would just have
returned a page. In particular, hugetlb folios that are not PMD-sized
would never have been prone to FOLL_SPLIT_PMD.

hugetlb folios can be anonymous, and page_make_device_exclusive_one() is
not really prepared for handling them at all. So let's spell that out.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index c6c4d4ea29a7e..17fbfa61f7efb 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2499,7 +2499,7 @@ static bool folio_make_device_exclusive(struct folio *folio,
 	 * Restrict to anonymous folios for now to avoid potential writeback
 	 * issues.
 	 */
-	if (!folio_test_anon(folio))
+	if (!folio_test_anon(folio) || folio_test_hugetlb(folio))
 		return false;
 
 	rmap_walk(folio, &rwc);
-- 
2.48.1

