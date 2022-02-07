Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A720B4AC929
	for <lists+nouveau@lfdr.de>; Mon,  7 Feb 2022 20:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19AE310F84F;
	Mon,  7 Feb 2022 19:07:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AA310F848
 for <nouveau@lists.freedesktop.org>; Mon,  7 Feb 2022 19:07:03 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id e28so14632831pfj.5
 for <nouveau@lists.freedesktop.org>; Mon, 07 Feb 2022 11:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+WVqg4iM1IK5woHe616yKoTPDV85yaqed+lmC/0zx4Q=;
 b=E8Yv+tJ27QtdnqCiahy1ynDTxSrIHFQS9v3T6SGxOtbvrS4oJdOaAbBOu5WkKuOBfd
 YZVQDjXpyCcHf5TePEiE9WLubJVn7pkXJNntqfcUu0FB+cpVUKi2U/fVQ/r2P4FuKOGP
 rrsKex566q7w8weRBoU0ZAbtyAsexA2NArqSSGJ8aSE3asKbO/kySJdCGSVU84OEGUiB
 QCLOFQgtfcBKBXnXRpXprEE7iAtFckobPiWULixyKadweXpHSIl4fOM/cfTnhyD31lEn
 X5EcS76XqYpJKN3mK9thEa6gK63RHYW8pEdrhtUg2qPw6l/cPnln0K7VaxQOTiViReVV
 h7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+WVqg4iM1IK5woHe616yKoTPDV85yaqed+lmC/0zx4Q=;
 b=uaKccpxhYNzoOsc6Trm4LOJRX9p83GBSeeHf84edBogOAEwt03MVftR3C6OlySCYZX
 DTd1vvPofykP/1C/7Vr3E1MCEddEtvhhju8tcnytOQ6cKeYK/PDh1H46nkl92Xp32MGv
 3ptcS1kjIGKCXBxgv1e3qQM9NJUN9c7Prkr/S3WNW7oxcOT4m+IYHl5MuWSTG0O0GAC6
 Ig6q1oO1JNkbglDIJq2eJNha4HvdITmKtFrktGmMHvWeMBzdgdygYz3QS8GHNd8Zuo/N
 C9US7lx7ss8B0H7eEsoxqGFBl9GsLdwmw89Zy0kTeA/xTKx4E37W8buY0OJSGupMt3ts
 yMhw==
X-Gm-Message-State: AOAM531pq8nZTlQCw2OOgRgFpKpW9q4a0Ol5SSqkSrBtpAYbrU4jkhS7
 km2pZuIfo0XylbqtgGFjJg+H0TFE3eMotYpfWPPeqg==
X-Google-Smtp-Source: ABdhPJx4gFwHpx6eXlK2M23aHGpthiH4fAIYOpnEcI58LRfZznkCnIjyKeDQJsC3Q3CmCC8lC+fdRuCFIdo+hfnPs1A=
X-Received: by 2002:a62:784b:: with SMTP id t72mr939106pfc.86.1644260822995;
 Mon, 07 Feb 2022 11:07:02 -0800 (PST)
MIME-Version: 1.0
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-5-hch@lst.de>
In-Reply-To: <20220207063249.1833066-5-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 7 Feb 2022 11:06:52 -0800
Message-ID: <CAPcyv4ipZUeCjf5teFQuJX5DEs7ViGHW_PKKfoJEK8chjJTZig@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH 4/8] mm: move free_devmap_managed_page to
 memremap.c
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
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>,
 Ralph Campbell <rcampbell@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sun, Feb 6, 2022 at 10:33 PM Christoph Hellwig <hch@lst.de> wrote:
>
> free_devmap_managed_page has nothing to do with the code in swap.c,
> move it to live with the rest of the code for devmap handling.
>

Looks good.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
