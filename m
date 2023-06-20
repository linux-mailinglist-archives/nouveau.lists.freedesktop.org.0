Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561127362DB
	for <lists+nouveau@lfdr.de>; Tue, 20 Jun 2023 06:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6221810E178;
	Tue, 20 Jun 2023 04:54:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6DF10E178;
 Tue, 20 Jun 2023 04:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Yc66fUlnmb/kcfRHAutRPTPlR7aOXI92f3ikApgFp7c=; b=j3lCu5xG2URvoqKD7B4juv1hDZ
 1IDDKgwG1Qafw2ZR6npqaKluQHJNtnUesI7a/qsV1KbjlnTt9euutbIhDBqtBzuIDcnHLVTfYWgwD
 byDZzm8ELL5OCK2eiUJ5eUuk+GdKV026uygT45LTgP0n8ePk/VtJO1jcSi0FtaIO9GXRhLH9OwK5U
 ChxFu+xaY6orxxgAySoKMy00ExVKbEHuQpeqFLqsDfY/hio1QPdA/prJyyC8ZppvVHVgleS8ummvL
 sSpuQ4NIGOQV+ra8mJT9VlfWlWbxwG0FOwfY2kwAZB/uO+CVKFoczc2KaW0xjZfRNZVLQeKXBaakx
 OGdVTjRw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qBTO2-00A9fP-2f; Tue, 20 Jun 2023 04:54:38 +0000
Date: Mon, 19 Jun 2023 21:54:38 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Danilo Krummrich <dakr@redhat.com>
Message-ID: <ZJExDn9tH6ydx2FY@infradead.org>
References: <20230620004217.4700-1-dakr@redhat.com>
 <20230620004217.4700-4-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620004217.4700-4-dakr@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Nouveau] [PATCH drm-next v5 03/14] drm: manager to keep track
 of GPUs VA mappings
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
Cc: jason@jlekstrand.net, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, bagasdotme@gmail.com, matthew.brost@intel.com,
 corbet@lwn.net, willy@infradead.org, bskeggs@redhat.com,
 Dave Airlie <airlied@redhat.com>, Donald Robson <donald.robson@imgtec.com>,
 mripard@kernel.org, Liam.Howlett@oracle.com, ogabbay@kernel.org,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com, daniel@ffwll.ch,
 alexdeucher@gmail.com, christian.koenig@amd.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Why are none of these EXPORT_SYMBOL_GPL as it's very linux-internal
stuff?

