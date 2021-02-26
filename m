Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A973326517
	for <lists+nouveau@lfdr.de>; Fri, 26 Feb 2021 17:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6E06EE09;
	Fri, 26 Feb 2021 16:00:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CF06EE09;
 Fri, 26 Feb 2021 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=EamPPS3h7fVjeEpI3tKYviNwqcgB413i1NxGP8NfeLs=; b=DOVv70XUKQtdKygFHek5cnEJ85
 0aTTboqAAgZ9qXyU+wvlxiSzxHtP1ym4mKpFkpWJ3QrVxX0cg6HLjlMEa8smCT5d8MQt61EDedcdp
 +cTZQS6QIMEX7e410ahtRCLv73gL+enUpX0Wom3/7llnYOMvelDCfuonLeizIRAR1SdOneLRseMPl
 +1yqeJqd3wMbIB2+lHxnZefZs6Iwd3dwFPaxBSuzi7SJX4SRmj6HqKThuHBIGN0eQ78vYpHSlanSp
 RTjuTNxJkP+R1AKO1M0JYbI4J9klNvewkX6eyN/pVf5SdMMndMiYrQSVRic0CMcp8m3gG1o/L4yHJ
 PlEtnshw==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lFfXA-00CD8f-0u; Fri, 26 Feb 2021 16:00:04 +0000
Date: Fri, 26 Feb 2021 16:00:04 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <20210226160004.GB2907711@infradead.org>
References: <20210226071832.31547-1-apopple@nvidia.com>
 <20210226071832.31547-3-apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210226071832.31547-3-apopple@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Nouveau] [PATCH v3 2/8] mm/swapops: Rework swap entry
 manipulation code
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
Cc: rcampbell@nvidia.com, daniel@ffwll.ch, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 bskeggs@redhat.com, jgg@nvidia.com, akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Feb 26, 2021 at 06:18:26PM +1100, Alistair Popple wrote:
> Both migration and device private pages use special swap entries which
> are manipluated by a range of inline functions. The arguments to these
> are somewhat inconsitent so rework them to remove flag type arguments
> and to make the arguments similar for both a read and write entry
> creation.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
