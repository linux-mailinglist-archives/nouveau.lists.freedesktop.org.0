Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FA26CF989
	for <lists+nouveau@lfdr.de>; Thu, 30 Mar 2023 05:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8636010E1C6;
	Thu, 30 Mar 2023 03:25:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F9310E1C6
 for <nouveau@lists.freedesktop.org>; Thu, 30 Mar 2023 03:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QsdrcA/589ltjZTcCcSDKKxhiJ7CxFHhrMptES1Y1Y4=; b=kCLl9rOwAukh7rxNPXxtiHwW8O
 lQAXiJJLCBIJoYmn25bgm7fUmTyjao2WNq0fUKa7MYSEoZkj5uhTcDXOflP0I/EG+CK/Wew4f9MDI
 ev9V3sICwqrdQpAn8cdhaRxIIySQ9L+GQDxbS2RKgQ5Clti3OhhC46fYAIb/TmKjYBq4fWhPdCVlm
 mPaO8xMRZ4Sz8smTpsbJBXGG990uT1jm5bcRHC+covfjndwA+GADrfEG+E/pEawLdsgkRos45E+gF
 ERT5FiN9iD7VrIq4peh8JlAgh3StRBGWf8owsshEdK50kvcTDDS5QLMix8kDddaydtYeZ6kXnt0PJ
 x7iNrOnQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1phhwZ-002LET-1c; Thu, 30 Mar 2023 02:23:15 +0000
Date: Wed, 29 Mar 2023 19:23:15 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <ZCTykyabcaS98Jnm@infradead.org>
References: <20230330012519.804116-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330012519.804116-1-apopple@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Nouveau] [PATCH v2] mm: Take a page reference when removing
 device exclusive entries
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
 stable@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

s/page/folio/ in the entire commit log?
