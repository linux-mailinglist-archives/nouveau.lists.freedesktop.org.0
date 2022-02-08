Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BF34B01BF
	for <lists+nouveau@lfdr.de>; Thu, 10 Feb 2022 02:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E8710E71E;
	Thu, 10 Feb 2022 01:00:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F67910E342
 for <nouveau@lists.freedesktop.org>; Tue,  8 Feb 2022 08:07:45 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id c6so47607895ybk.3
 for <nouveau@lists.freedesktop.org>; Tue, 08 Feb 2022 00:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PXxGXqL0fSEKZMDAAFA60E1Rbs/msz2tQymkFw5ax8o=;
 b=qlzWW2qtvfYAAanbEMYNLuRx8ZSraE6ZerXTO+z8zhvTvhhuYlpIgqjAKGiZyn03oe
 dobQls8uADFSdqKk74wWyKhvtGm+6ci7zMlOM/25PMWhbnesE0+5XQtQJ1DQ4BSmrIVR
 KXs5u2kjzPM5yfRm+Agx/SxngcjD9ixaxLZX1vw+RU3PzkOEaYN8IUkGN+VCPNNtWbRa
 OkYOtxUahGsG7+n6hO78zD3yqAbAhOS+2yz1YaW3MqVv7bTnB7WgJxSZvd7dRu/1CoqZ
 ioyre/8Cv4eirgKtPsl7phMdGqzPgirLv2toaU5HewuA29ykBKN/lcY8q2AtU/epI3VH
 FJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PXxGXqL0fSEKZMDAAFA60E1Rbs/msz2tQymkFw5ax8o=;
 b=Yi5oQc7kd2zDzPSy4DqK0I2cyEiGOIaLmsWNR94zgvi3t1dQ12kotu67VEvTD2KMiD
 l9AbPZFv4eRo28q53BmDFafN79zIpnu5KGUN+xG36ExtQvqUkPKnFpEEFtfrx2ga9icT
 FTXBmBXuklYkzOzYDShKpURoWSRISvdeRZEQeNr2bZ0UAsgjdCULVeWPXP2ed7al9Ggj
 ywOK0cjEkJ4gQ9wXptXxe0r8tM39flPBO1VkWBw/GCxuLv1W9lHtVzxyO1eziritETT9
 Cn6YZpJASgiCmoXTllAKHEbmrKQtIdtsdfZnJZmi6l+PcRYxJ3TK5eSmwFi37BAxK65U
 WnDQ==
X-Gm-Message-State: AOAM533bogX8VKuoBZZanU76kkERvQObafESF1hoVes2x7m1fesL8tnA
 pFL23XSQPAovxYlEfYHHnlVI0enevPP+jOm/uWo0GQ==
X-Google-Smtp-Source: ABdhPJxrFiobqvBhVclJNZluCx9G58Pv+JirZ6BIfPGVufYPFT03Bj1OgbKZjqvNPQBBROocQXaDN+k+XywWU2el4os=
X-Received: by 2002:a25:4742:: with SMTP id u63mr3440116yba.523.1644307664507; 
 Tue, 08 Feb 2022 00:07:44 -0800 (PST)
MIME-Version: 1.0
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-3-hch@lst.de>
In-Reply-To: <20220207063249.1833066-3-hch@lst.de>
From: Muchun Song <songmuchun@bytedance.com>
Date: Tue, 8 Feb 2022 16:07:07 +0800
Message-ID: <CAMZfGtWA3M+ck8WduwxyoDiXpjC1kXs=irVZ1m-SMSREJG17Mg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 10 Feb 2022 01:00:19 +0000
Subject: Re: [Nouveau] [PATCH 2/8] mm: remove the __KERNEL__ guard from
 <linux/mm.h>
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Feb 7, 2022 at 2:42 PM Christoph Hellwig <hch@lst.de> wrote:
>
> __KERNEL__ ifdefs don't make sense outside of include/uapi/.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.
