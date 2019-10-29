Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4F612B328
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03B66E3DF;
	Fri, 27 Dec 2019 08:14:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00064.outbound.protection.outlook.com [40.107.0.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D859D6E81F;
 Tue, 29 Oct 2019 23:09:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvnVdymBIx5Pxb8ZKLGPqZuF0soY45aDiiPWMkzqzpy3MDhbkC/NkLxCZmGIkJvaPUSv5vdtPg1xZ9OtoMQ3bwAnI4+RJC9iDUh0W5TBYZryJ8K+o1D7YiY4VL3b4PTTLfN3GL029qscJ5z/HtzgwRsu6VIN53w3IymV6p7Z72QkzENvA5PJP8v10tY3F+Ya7raYD37KbzcbsJAePsfAkOtixTMfWtSZ7PrlmBQQfDkzdNqIWi6sFteqmc93cXy00vRIIOuwVmowCjF8h1KahmDefp5VEsr4i1ga7OGljNDpH3edYJErIlH0wu8WrhbeBycTIGQNj+sfDGxlyXDejA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6M0IwHvQcuLxPhw+vcshMi9hO3AjNiTbBBJwe/ONCQk=;
 b=bxozRACKA6JsNnLBII2prhkuzV84mxBcMQL6f1EhfCPZ44DoIFwphqQzaKPLIaBB4RWsplCwZqLcqGaMdQQ12E0Cgypv2jJUejM+n/wwa5AY5Tu0AFruAIibxTjgaW6WKFPHKVKNls4A8x5Xu6oJVeCWXf8HCuNQMqzgGn7DWEEOLAVaM9rAh+nXOSHy7zaVFF3suzwhDAq1O6nY3GDN056vT7g1gNXL19I0fvxaPjBSB+XRKYcqt04ymMdM+KQ2WROcBm3GHoXC+a1RtoRnDV1MwsoENIaFljZ3mre569Zxwy9qsd7LyQpT8/Adyy+LdFpM9hvdS23FAF6G9Ty7Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6M0IwHvQcuLxPhw+vcshMi9hO3AjNiTbBBJwe/ONCQk=;
 b=sZ6bWBS7znaaf/MWA9CJ6b6zuO2zfa1GLK8fQ8388hQQsWnQh5tvs29gYUSgHQKQMhPjpKnW7qth5xsBOppb+lQ0vPhgtSoL9gaBkJkUWyYml2/rgooV/0DKe8Mf2y/Kj/nDGaLy1wdkO9I1+AR6OkWTr2W5nHyeI+fiKpH+i8o=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB3486.eurprd05.prod.outlook.com (10.170.237.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Tue, 29 Oct 2019 23:09:47 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2387.027; Tue, 29 Oct 2019
 23:09:47 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Thread-Topic: [PATCH v2 13/15] drm/amdgpu: Use mmu_range_insert instead of
 hmm_mirror
Thread-Index: AQHVjc0/OrofSfizc0Ocze68uYhonqdyMNyAgAAPbQA=
Date: Tue, 29 Oct 2019 23:09:46 +0000
Message-ID: <20191029230942.GW22766@mellanox.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-14-jgg@ziepe.ca>
 <6c511ee9-4cbf-bd33-e720-f2d2b5c3c28b@amd.com>
In-Reply-To: <6c511ee9-4cbf-bd33-e720-f2d2b5c3c28b@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR17CA0026.namprd17.prod.outlook.com
 (2603:10b6:208:15e::39) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e50a329e-97db-4160-ab8f-08d75cc51775
x-ms-traffictypediagnostic: VI1PR05MB3486:
x-microsoft-antispam-prvs: <VI1PR05MB348629CF33D906AF5236C2DECF610@VI1PR05MB3486.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(199004)(189003)(386003)(3846002)(6116002)(52116002)(6436002)(66556008)(64756008)(66446008)(66946007)(478600001)(76176011)(6506007)(446003)(11346002)(476003)(229853002)(6486002)(14454004)(71200400001)(102836004)(2616005)(25786009)(6246003)(186003)(66476007)(14444005)(4326008)(26005)(86362001)(256004)(6512007)(71190400001)(7416002)(54906003)(316002)(5660300002)(36756003)(305945005)(7736002)(6916009)(66066001)(8676002)(1076003)(8936002)(33656002)(99286004)(81166006)(486006)(2906002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3486;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l2P6pN4hzgopHlL/6p5nJNk4ZgU402v1X2BkK/1XbckT2ba++zoajfgT7aP1tGt2LGaV8vpWGS9ekAXYW78brVwLeRw7rltYFdPWB8u1QuGa5aDe7kF240TpQQFHcfDnenZ7rjqNp5PfN9SWxF/BlAY1roVRqafStQzCqTQPyK84pbfltrxBKntVKgPsITHfGILxZoP439qfujRcNhclAhxvEafDP6U3yZcEIienYSPOJlPu9z4Hz0IWHSAg/WgEIH/OVZA4NALhtvhWM4qzFcgkNNYDusM4kRbIuo3JO8iZFcavf9q3E8mgDrTue+A/nK0e8jJuKAveFC1AGbqOUkwIRNFoI3JtDPIrnu5gb/SVliUT1TvYcGcARUHiXYy5r72NpNuEO0oHY74YxSfiZ0Bn+XZvo3qXzpVf1MEbQWF89/QDPZRRV/thfqpdAZcE
x-ms-exchange-transport-forked: True
Content-ID: <D37E357C3EB6BE4CBBDAB15F1A671056@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e50a329e-97db-4160-ab8f-08d75cc51775
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 23:09:46.9454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DJJ+lGSubbm7J3H3g3sqyNdtlbVoID2fb7M7vBgmXHiN2ZSIzRamfrXc88svCl4Ys0jSzTEQK4ogWQ0ciARDrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3486
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:32 +0000
Subject: Re: [Nouveau] [PATCH v2 13/15] drm/amdgpu: Use mmu_range_insert
 instead of hmm_mirror
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
Cc: Juergen Gross <jgross@suse.com>, "Zhou,
 David\(ChunMing\)" <David1.Zhou@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Oct 29, 2019 at 10:14:29PM +0000, Kuehling, Felix wrote:

> > +static const struct mmu_range_notifier_ops amdgpu_mn_hsa_ops = {
> > +	.invalidate = amdgpu_mn_invalidate_hsa,
> > +};
> > +
> > +static int amdgpu_mn_sync_pagetables(struct hmm_mirror *mirror,
> > +				     const struct mmu_notifier_range *update)
> >   {
> >   	struct amdgpu_mn *amn = container_of(mirror, struct amdgpu_mn, mirror);
> > -	unsigned long start = update->start;
> > -	unsigned long end = update->end;
> > -	bool blockable = mmu_notifier_range_blockable(update);
> > -	struct interval_tree_node *it;
> >   
> > -	/* notification is exclusive, but interval is inclusive */
> > -	end -= 1;
> > -
> > -	if (amdgpu_mn_read_lock(amn, blockable))
> > -		return -EAGAIN;
> > -
> > -	it = interval_tree_iter_first(&amn->objects, start, end);
> > -	while (it) {
> > -		struct amdgpu_mn_node *node;
> > -		struct amdgpu_bo *bo;
> > -
> > -		if (!blockable) {
> > -			amdgpu_mn_read_unlock(amn);
> > -			return -EAGAIN;
> > -		}
> > -
> > -		node = container_of(it, struct amdgpu_mn_node, it);
> > -		it = interval_tree_iter_next(it, start, end);
> > -
> > -		list_for_each_entry(bo, &node->bos, mn_list) {
> > -			struct kgd_mem *mem = bo->kfd_bo;
> > -
> > -			if (amdgpu_ttm_tt_affect_userptr(bo->tbo.ttm,
> > -							 start, end))
> > -				amdgpu_amdkfd_evict_userptr(mem, amn->mm);
> > -		}
> > -	}
> > -
> > -	amdgpu_mn_read_unlock(amn);
> > +	if (!mmu_notifier_range_blockable(update))
> > +		return false;
> 
> This should return -EAGAIN. Not sure it matters much, because this whole 
> function disappears in the next commit in the series. It seems to be 
> only vestigial at this point.

Right, the only reason it is still here is that I couldn't really tell
if this:

> > +	down_read(&amn->lock);
> > +	up_read(&amn->lock);
> >   	return 0;
> >   }

Was serving as the 'driver lock' in the hmm scheme... If not then the
whole thing should just be deleted at this point.

I fixed the EAGAIN though

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
