Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90357389516
	for <lists+nouveau@lfdr.de>; Wed, 19 May 2021 20:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948F06EDA0;
	Wed, 19 May 2021 18:11:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5416EE4D
 for <nouveau@lists.freedesktop.org>; Wed, 19 May 2021 18:11:40 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id 124so1334173qkh.10
 for <nouveau@lists.freedesktop.org>; Wed, 19 May 2021 11:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=or1ZgkIQlqYFYsbWx3HhSVHrt7I2XsoIRsMCoyF7atA=;
 b=I/E/dqxF8ccpwh/ck606guAAMWoUat0ewjyFBZ9qGkhCu+vdKW45Md3waidHfBOcnl
 Eqf1Yqt6PeBfuumUioxkOduMozTmgdMFtcGyfioxsOPJPRJNLQ4jnjVT2qXlY+aMTE6E
 n7D/gwnI3FA/CndzpSeeQcEVAbeVLZcdSje0mF9X8XYry5kvfJA08rwWvgD4wPSJXSxT
 OsS/Aayfy63b6fpecJGRSsY77jP3vVkN8R6CGJWR1dZB/hRSXxQjJgultC8aiJBdp/z3
 sgzp5mgSXuEbYvHkj9t8yxM9KWR7IESTnh3nA7XZ90l/rulprpDCqqE41qNPvP+D22Cv
 UXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=or1ZgkIQlqYFYsbWx3HhSVHrt7I2XsoIRsMCoyF7atA=;
 b=qiF6aYKagw7HusoDPmCA9FCosw/GVxK2Nc+v0UYtUtANONlMsW2C281dF06sUsyufF
 XhfT6t7vdg/zXV/Vao8toPII5v7lCjN725wqwFVIpsiP8htjaBwA8NRkBkVgOAxETjc4
 eAafHChJSUzkK3bSQMuUjN5jhwAu1MF5dgBf9IkFcgVpqu7vDduzQxqcWEOejWTVXTzO
 eNhundsJwTNQ5EKDi7SWI2Z94GjmHjV4BQCcA9kL5tEIzocvA/7WT46p81s+V2ipFhYp
 6RDGsO/cfgcAOHjVcvGTxdl/fTDi7p2MxseGKhYZVV8lYQke3rbTQNomLub2m2jWa9OH
 TO6A==
X-Gm-Message-State: AOAM533S+LBWumHa1uwtcHXQxaAy8iNUoukAF/58q8SEGzlzxe+xZN+R
 9qXnCsVge9j9F8RYQACkvGLfRw==
X-Google-Smtp-Source: ABdhPJx6qAlzcCgcAFZQhi8apeXZnalyGtzPK6kX7YL/irC69Yj1Id6m3qzKmV8x697R45dsX2JLtw==
X-Received: by 2002:a05:620a:2456:: with SMTP id
 h22mr691145qkn.292.1621447900188; 
 Wed, 19 May 2021 11:11:40 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id g1sm136589qtr.32.2021.05.19.11.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:11:39 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1ljQfS-00AnPK-Mv; Wed, 19 May 2021 15:11:38 -0300
Date: Wed, 19 May 2021 15:11:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peter Xu <peterx@redhat.com>
Message-ID: <20210519181138.GU1096940@ziepe.ca>
References: <47694715.suB6H4Uo8R@nvdebian> <YKP5Dj4Q/riGGc43@t490s>
 <20210518173334.GE1002214@nvidia.com> <YKQBACJCjsxeM3ro@t490s>
 <20210518194509.GF1002214@nvidia.com> <YKQjmtMo+YQGx/wZ@t490s>
 <20210518230327.GG1002214@nvidia.com> <YKRRgZmRMdk1vH7A@t490s>
 <20210519132842.GJ1002214@nvidia.com> <YKUcHfhQMbDnjXC7@t490s>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YKUcHfhQMbDnjXC7@t490s>
Subject: Re: [Nouveau] [PATCH v8 5/8] mm: Device exclusive memory access
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, bsingharora@gmail.com,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 bskeggs@redhat.com, daniel@ffwll.ch, akpm@linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

> Sorry for the noise.

Not at all, it is good that more people understand things!

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
