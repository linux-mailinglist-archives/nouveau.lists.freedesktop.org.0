Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1704A12B2AC
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD7E89FEA;
	Fri, 27 Dec 2019 08:13:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50074.outbound.protection.outlook.com [40.107.5.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61C46F9CD;
 Fri,  8 Nov 2019 15:26:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idKNgVf6jVKmbn6oZNk9d+o8KH7zrMRnjZD09mWHwJr1/Kxwjg9irWZz8wWN8iMzB+kY6x+9k/dogRsJj3V7yEwt2b+4OFPvnbx391j5hjzouuGcFBN5P4G22TybBTWhVB81KY/RZyfH+qFzCBzuTiPsL+wgIQd07yvHjjuU59+wdgxn+FxMpsQiCOoxgdcjIPFKaDH6wSiwDrzBlaz9Lww5l2XpW20b3OmI2RlMnAcdL6TJGAvQepg7DXJ8oZ3lfTW2rLzSpmJ3ZMhKuH5l+QRkygbkZjy3PcYMuP4lhEAcN0rfB0ggFNTOxeczIqDQAV2gNOMTwnYs2gwOF1XlOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kzwnbT9lm5Y4lK5jkW6EgWFPhy9eP7jnPkK++jCXto=;
 b=Q8DoVKO4xnqyDKSCkqug+bVxTz+cnMeujvO8wrNNM32hDUD4MHUDMPpuThmelGAywWEkmjgLL2yaZDGXEEGW28al/EOTeelBH09HIJmoLLapQQQMR2Wa3lJKGBNEKpUv4w5mT+zFM5d8+N7ppJHb+sj4jZOzLC2f6UQEvKTPA1pnXni4rUz1TVLxDF4OWUuK8Pi6FckgsvAWQnfd/lD2aYaSNLTIBZ+miFpOMeaFnkhjg7hy12ft+FCvFi8UrWOhYr4Idh+J8+wZOFDw/kfwnMUEb2JDeGtrbfOSDMN3xcQyNhy//2L1EFoTwx5ugi0xvS8XFKgCXCD6TQfILJ8veA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kzwnbT9lm5Y4lK5jkW6EgWFPhy9eP7jnPkK++jCXto=;
 b=c0UJRdvRuINyqTVmXmI/thqBzveZgdEHz47hKMouKFoyBRIHHDEk5fB0460jdTvl8snP1wiYe+IApdU+ZKaRIND+OK8IsMS4uIkkzc7pyh4nKycQBPIpbZ5XCcdsTd0WS/jSFmyiqf/xjGlmQmzUP8rvNf5998PPM3tyH/mT8c4=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4109.eurprd05.prod.outlook.com (10.171.182.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Fri, 8 Nov 2019 15:26:03 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2430.023; Fri, 8 Nov 2019
 15:26:03 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: John Hubbard <jhubbard@nvidia.com>
Thread-Topic: [PATCH v2 02/15] mm/mmu_notifier: add an interval tree notifier
Thread-Index: AQHVjcvJYOye0EiwZkisYK74G5bmhqd+54eAgAFKcgCAAA1gAIABNrMA
Date: Fri, 8 Nov 2019 15:26:03 +0000
Message-ID: <20191108152558.GG21728@mellanox.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-3-jgg@ziepe.ca>
 <35c2b322-004e-0e18-87e4-1920dc71bfd5@nvidia.com>
 <20191107200604.GB21728@mellanox.com>
 <9dc2b3c7-f945-b645-b3a3-313a21d2fdfc@nvidia.com>
In-Reply-To: <9dc2b3c7-f945-b645-b3a3-313a21d2fdfc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:208:160::43) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 48b76905-ba05-4f4b-6fcb-08d7645ff747
x-ms-traffictypediagnostic: VI1PR05MB4109:
x-microsoft-antispam-prvs: <VI1PR05MB4109D9C9A1D1C0D6DB42E1FFCF7B0@VI1PR05MB4109.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(199004)(189003)(25786009)(1076003)(486006)(386003)(14454004)(6916009)(316002)(99286004)(81156014)(478600001)(7416002)(81166006)(2906002)(6486002)(8676002)(446003)(6246003)(26005)(6512007)(6506007)(71200400001)(102836004)(2616005)(6436002)(71190400001)(8936002)(86362001)(36756003)(186003)(64756008)(6116002)(33656002)(305945005)(66946007)(66446008)(66556008)(66476007)(229853002)(76176011)(3846002)(256004)(66066001)(5660300002)(54906003)(476003)(11346002)(4326008)(52116002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4109;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mV1RVWzPHLCQNN+LpAFkG7yEBh05U7w1QVa67j7ZZAtua2jv39j8Xb/7sQh+UCt9aThT0voGO9OdBWBO7n/SrpZAMioLYZvB+KfM5+vdiurRcDSwB6cwms1JEOijwDUI7PzJ17D+O1lQos3uJuuJfa8q4CYuLJBWWtJnPkMUtSCvrQxVcO1SX59e8ioTGsgr4YIF707P6SvIbKYtwhclZ9SVHODVVBIi/4ol3HIn/v0CqXXZmpCbGknthx8K3MmtzmcNWP/XIl/fknAYdSlD5iq+qhM9SljIFCAHf27p/G0xhqIR7uXIbG/JC/jWG0bXYL119G0tCCoc2nyNzHCl6Aqe2AsfgAHapZB06CTo0QYGBqce5X4BhyUF5AhjZV66BcyKIx8ZrHRi6eXMZ1zUuHfwwlj1GKM1dM4yw3F1cmjeODUl1sqKfofwGUv5jQ3l
x-ms-exchange-transport-forked: True
Content-ID: <8E8D480DDF199A4F8FA32DCA04F55AF3@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b76905-ba05-4f4b-6fcb-08d7645ff747
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 15:26:03.3786 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: azgdi27g8r0XKelABYVgzind4SWdZTnXU+8dGloSmUVxbgjx88SpHAZBy5oMZKbrSYfHEZNJYuOPM8eICD97RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4109
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:32 +0000
Subject: Re: [Nouveau] [PATCH v2 02/15] mm/mmu_notifier: add an interval
 tree notifier
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Andrea Arcangeli <aarcange@redhat.com>, David Zhou <David1.Zhou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Nov 07, 2019 at 12:53:56PM -0800, John Hubbard wrote:
> > > > +/**
> > > > + * struct mmu_range_notifier_ops
> > > > + * @invalidate: Upon return the caller must stop using any SPTEs within this
> > > > + *              range, this function can sleep. Return false if blocking was
> > > > + *              required but range is non-blocking
> > > > + */
> > > 
> > > How about this (I'm not sure I fully understand the return value, though):
> > > 
> > > /**
> > >   * struct mmu_range_notifier_ops
> > >   * @invalidate: Upon return the caller must stop using any SPTEs within this
> > >   * 		range.
> > >   *
> > >   * 		This function is permitted to sleep.
> > >   *
> > >   *      	@Return: false if blocking was required, but @range is
> > >   *			non-blocking.
> > >   *
> > >   */
> > 
> > Is this kdoc format for function pointers?
> 
> heh, I'm sort of winging it, I'm not sure how function pointers are supposed
> to be documented in kdoc. Actually the only key take-away here is to write
> 
> "This function can sleep"
> 
> as a separate sentence..

Sure

> > This odd duality has already cause some confusion, but names here are
> > hard.  mmu_interval_notifier is the best alternative I've heard.
> > 
> > Changing this name is a lot of work - are we happy
> > 'mmu_interval_notifier' is the right choice? 
> 
> Yes, it's my favorite too. I'd vote for going with that.

Okay, lets give it a go

> Very nice, would you be open to putting that into (any) one of the comment
> headers? That's an unusually clear and concise description:

Yep, done

> > > > +int mmu_range_notifier_insert(struct mmu_range_notifier *mrn,
> > > > +			      unsigned long start, unsigned long length,
> > > > +			      struct mm_struct *mm)
> > > > +{
> > > > +	struct mmu_notifier_mm *mmn_mm;
> > > > +	int ret;
> > > 
> > > Hmmm, I think a later patch improperly changes the above to "int ret = 0;".
> > > I'll check on that. It's correct here, though.
> > 
> > Looks OK in my tree?
> 
> Nope, that's how I found it. The top of your mmu_notifier branch has this:
> 
> int __mmu_notifier_invalidate_range_start(struct mmu_notifier_range *range)
> {
>         struct mmu_notifier_mm *mmn_mm = range->mm->mmu_notifier_mm;
>         int ret = 0;
> 
>         if (mmn_mm->has_interval) {
>                 ret = mn_itree_invalidate(mmn_mm, range);
>                 if (ret)
>                         return ret;
>         }
>         if (!hlist_empty(&mmn_mm->list))
>                 return mn_hlist_invalidate_range_start(mmn_mm, range);
>         return 0;
> }

Ah, that is a different function :) Fixed

> Looks good. We're just polishing up minor points now, so you can add:
> 
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>

Great, thanks, I'll post a v3 with the rename

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
