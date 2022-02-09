Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A84D14AE7DB
	for <lists+nouveau@lfdr.de>; Wed,  9 Feb 2022 04:30:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DC510E3B9;
	Wed,  9 Feb 2022 03:30:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67EB210E36E
 for <nouveau@lists.freedesktop.org>; Wed,  9 Feb 2022 03:30:22 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id i21so475917pfd.13
 for <nouveau@lists.freedesktop.org>; Tue, 08 Feb 2022 19:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Je4ysSvm0qGToTfluoX75kuGzoNSHI2qP2Y0C0VNAg=;
 b=CACwA3iWs0mIexxr+JBAReAIEm1js+p8Gd1PctwBpcCRlFarncrQq8u4LV6np8g3is
 D/VOuIRXeoPfghb+/9LTlJtNpAvNKgMSy3Wr4lug4rsCM8eyWtwax7omfbUtcsy/9gV0
 7zKe0Yw5vrIzVjXV0RntPZ6HYUDb3Ci9Ac0MxBz7ePn0Cx3ZAESjOlA/plyTn3cK/JDB
 /4GywPgMyr1VKT1Ars0+RfQs5u2gxDhVAMm6XqUo1P+6wobSWI5xZqPyxvBbdotA9rpW
 M0SPWo6TnlLbTZEqquatVpsjK0f4E620XEFwl1wrQ1s/OMsFf6/RTMOBX8yu4cXgNOQf
 8MqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Je4ysSvm0qGToTfluoX75kuGzoNSHI2qP2Y0C0VNAg=;
 b=UULAv2yxh0Bmy/izywYa+wKqJ0K0hfQ0CfSPEzUfpt1IrTEHTUwAnFfb8E4quawoBG
 t7MouANLFX3PnO/dU6UME8MwQUm0KMjI4q9CiqqXmUjTvHeQmmnacGzjZE82+1Ea4yJ4
 V64b2ERf0cDScYnVW3wXJz9Az//3294F162j4qPAHIX6Snw1jekML7K6GwzCvpX7TCMD
 l55JD2/TuBVEH6pa0DnmC6zoQx3CVH6lAC1vl/fcN2Uiwlo8GWGrdnXiK81qYslDATzu
 dyRBK1urqE/h8Ao1DnzsCCumrnu6k9BaycDbgQI+eB0PPdwioa9/TNPa1fxJsggHkL3h
 tJFA==
X-Gm-Message-State: AOAM5337sgRUULu+oHXUH081hDgHzbPW4UJGS7wnzUMdPOgoWCYjA9CK
 M5rlsyL7O4FTgx3ngX6DYTxSLWgPL7NH5fSIFZgumA==
X-Google-Smtp-Source: ABdhPJxPkAe7JqNfPN0pMdUWTXV1LFyPzWR+xK9edhPa72Ip0qH/EBHDfJCzGhUn69nUH5cFutBmSs7V8IMhNpn2WjE=
X-Received: by 2002:a62:e907:: with SMTP id j7mr354037pfh.3.1644377421975;
 Tue, 08 Feb 2022 19:30:21 -0800 (PST)
MIME-Version: 1.0
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-8-hch@lst.de>
In-Reply-To: <20220207063249.1833066-8-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 8 Feb 2022 19:30:11 -0800
Message-ID: <CAPcyv4h_axDTmkZ35KFfCdzMoOp8V3dc6btYGq6gCj1OmLXM=g@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH 7/8] mm: remove the extra ZONE_DEVICE struct
 page refcount
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
[..]
> @@ -500,28 +482,27 @@ void free_devmap_managed_page(struct page *page)
>          */
>         page->mapping = NULL;
>         page->pgmap->ops->page_free(page);
> +
> +       /*
> +        * Reset the page count to 1 to prepare for handing out the page again.
> +        */
> +       set_page_count(page, 1);

Interesting. I had expected that to really fix the refcount problem
that fs/dax.c would need to start taking real page references as pages
were added to a mapping, just like page cache.

This looks ok to me, and passes my tests. So given I'm still working
my way back to fixing the references properly I'm ok for this hack to
replace the more broken hack that is there presently.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
