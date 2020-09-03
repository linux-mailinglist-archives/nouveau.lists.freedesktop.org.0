Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E719C25C161
	for <lists+nouveau@lfdr.de>; Thu,  3 Sep 2020 14:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A126E9EC;
	Thu,  3 Sep 2020 12:54:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0D66E9EC
 for <nouveau@lists.freedesktop.org>; Thu,  3 Sep 2020 12:54:43 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y2so1810189lfy.10
 for <nouveau@lists.freedesktop.org>; Thu, 03 Sep 2020 05:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=onLl8rTDQyvNpKgJJE9dFmq94UrkQmRn/zbTPNdul+w=;
 b=kyWZd6uSWtnkPJPjNC9/5GmYksI/3zvd739yEGMNVYRRPQ+obtq6kc0P1lySF1wLna
 /9pVxkncaXRcO2tuJq3pvnexLY4/WEYs6tUJiejalUKE87aVDxTtE8HGZioi56/HtvGW
 yphbM/vIdOQS1E8H5tT9vqdWIBrlZSJthYKw99V3Br+Jb4Wy1/Z14Ngc4JlLjaNb+iBN
 xdzS5/4L9tad8h/PIo9T2VsXCmgBMNtPZPjyG+MR2avtJUVy/CwEcgRJqvxxJyZ5cc+b
 kVEFsNzOzEK2uw81sjvtX00wvqAEmpeahxzGvmJf2FDEtGdxJK92HT48bXtJyIME/kON
 QHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=onLl8rTDQyvNpKgJJE9dFmq94UrkQmRn/zbTPNdul+w=;
 b=b0dQm27yRxhSrd/kXiNAQEL+v1BMMftpmaajlLdqUuJZQrBCHRoFiT7Wp1EAloQrrQ
 pIYPfJzP+rdsMjzmRffWzQO5FrqJ9Ee1ogVOuqWS0Kw6fU/6dZqiMJ+vlbFsMB+cndFk
 2FtLf22hCcnoWY6kcBK453mM01EwSnznMOWNXUHaSjwS4AGQfhNuML1BoTyJRXLsJKCx
 8Q+kOvYTo0eZ+obr2J+PAioWWe0K6YFcYbzRe+n8vPN2D+rKx2VbVow5aFiFRYi2OBbj
 K6DLFIfbbYqsaSnWkhFCApCIrlqpbZwEEFJtS6ieVGbrZ5mtbjIjUMzlIvytpOZGbV1Z
 1uzg==
X-Gm-Message-State: AOAM531eiaj58rbUImbggIS3WwEGLfyVIaU+fL2gjaJqEQBYzF3f4Fxf
 4ydr/zG14oRSB+xD6a3Y2n+2yw==
X-Google-Smtp-Source: ABdhPJxLwRZ25xqjpghlAiLuT8OszHqy2R0uqqhz3VeP7cshAVmBhDNDZKmnWNKpKHq5Fjz6I8h+WA==
X-Received: by 2002:a19:40c8:: with SMTP id n191mr1267052lfa.29.1599137681414; 
 Thu, 03 Sep 2020 05:54:41 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id l16sm595692ljb.72.2020.09.03.05.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 05:54:40 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 321BC102212; Thu,  3 Sep 2020 15:54:42 +0300 (+03)
Date: Thu, 3 Sep 2020 15:54:42 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20200903125442.4no5dq7mzcdllery@box>
References: <20200902165830.5367-1-rcampbell@nvidia.com>
 <20200902165830.5367-2-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200902165830.5367-2-rcampbell@nvidia.com>
Subject: Re: [Nouveau] [PATCH v2 1/7] mm/thp: fix __split_huge_pmd_locked()
 for migration PMD
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>,
 linux-kselftest@vger.kernel.org, nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Sep 02, 2020 at 09:58:24AM -0700, Ralph Campbell wrote:
> A migrating transparent huge page has to already be unmapped. Otherwise,
> the page could be modified while it is being copied to a new page and
> data could be lost. The function __split_huge_pmd() checks for a PMD
> migration entry before calling __split_huge_pmd_locked() leading one to
> think that __split_huge_pmd_locked() can handle splitting a migrating PMD.
> However, the code always increments the page->_mapcount and adjusts the
> memory control group accounting assuming the page is mapped.
> Also, if the PMD entry is a migration PMD entry, the call to
> is_huge_zero_pmd(*pmd) is incorrect because it calls pmd_pfn(pmd) instead
> of migration_entry_to_pfn(pmd_to_swp_entry(pmd)).
> Fix these problems by checking for a PMD migration entry.
> 
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>

Hm. Could you remind me what codepath splits migration PMD? Maybe it
should wait until migration is complete? We could avoid a lot of
complexity this way.

-- 
 Kirill A. Shutemov
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
