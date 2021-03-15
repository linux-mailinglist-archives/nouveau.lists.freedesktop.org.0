Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E62DC33ACC4
	for <lists+nouveau@lfdr.de>; Mon, 15 Mar 2021 08:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E2A89815;
	Mon, 15 Mar 2021 07:52:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239C089815;
 Mon, 15 Mar 2021 07:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=FCQj5B5Zp1rCBgedoXr3WWrEwlMWhZUzdqOcxosJGQw=; b=wRkw1cfr0IC8CR6t82z+HYxHFv
 VwF/tmGGdg4KPiwHX84XlVhB70vI4qKVPJb4zq2X0u72shDpS3zQnjEPkkVBEQyLoYdu7hZMdOQXM
 UIdFcYK8CUjNIvi3bzvpYQfQefNFXErUWa8P0ORjcvxmtaUgR3L2QHe8JipBS3IXKTRAUYM8zt3CL
 PlSQnfmpbv68kjqm6E5FTHerLPsTO1lDnQtEl+KweBJyzyuRjrj/f7i47X3awojHqCazrDuXVvNnJ
 B+BCGRiX8eIBhxPucslU4zDrXnmg9fLIfS7pNLD8peWWGhHmwlVcDfaGAn229P3hdRo0y0OsXuxsA
 QWr2l9bw==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lLi0P-00HOOO-B9; Mon, 15 Mar 2021 07:51:24 +0000
Date: Mon, 15 Mar 2021 07:51:13 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <20210315075113.GD4136862@infradead.org>
References: <20210312083851.15981-1-apopple@nvidia.com>
 <20210312083851.15981-9-apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312083851.15981-9-apopple@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Nouveau] [PATCH v6 8/8] nouveau/svm: Implement atomic SVM
 access
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
Cc: rcampbell@nvidia.com, willy@infradead.org, daniel@ffwll.ch,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, hch@infradead.org, linux-mm@kvack.org,
 bskeggs@redhat.com, jgg@nvidia.com, akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

> -	/*XXX: atomic? */
> -	return (fa->access == 0 || fa->access == 3) -
> -	       (fb->access == 0 || fb->access == 3);
> +	/* Atomic access (2) has highest priority */
> +	return (-1*(fa->access == 2) + (fa->access == 0 || fa->access == 3)) -
> +	       (-1*(fb->access == 2) + (fb->access == 0 || fb->access == 3));

This looks really unreabable.  If the magic values 0, 2 and 3 had names
it might become a little more understadable, then factor the duplicated
calculation of the priority value into a helper and we'll have code that
mere humans can understand..

> +		mutex_lock(&svmm->mutex);
> +		if (mmu_interval_read_retry(&notifier->notifier,
> +					    notifier_seq)) {
> +			mutex_unlock(&svmm->mutex);
> +			continue;
> +		}
> +		break;
> +	}

This looks good, why not:

		mutex_lock(&svmm->mutex);
		if (!mmu_interval_read_retry(&notifier->notifier,
					     notifier_seq))
			break;
		mutex_unlock(&svmm->mutex);
	}
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
