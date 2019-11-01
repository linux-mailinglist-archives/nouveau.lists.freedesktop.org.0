Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD1912B2E4
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:14:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B2A6E141;
	Fri, 27 Dec 2019 08:14:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00076.outbound.protection.outlook.com [40.107.0.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE21882B5;
 Fri,  1 Nov 2019 17:48:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F616PnDasdRhilz2Kc6qSBSImWwZldAPBk2MoucstrbO33xqeD34L+gHY1s6qonatRhw1WSWiK7h9DuvBWDXbxq855BA3gO33b9rt6iu6agzY10GvNpgYIZ8IvhNSaCQ0q4CJCYlatlk3IPuGwRlb4ne8o8f9XzUvEvDb/efSa1xU0Ea94EzZD6z+FKXFP+5ZfUs8P9FC+0Mi3eI/pdwJwgGv7AHx2pmeGBnbdc2EnCmjelCwG9xIbTmb160RQ4SDrBfQqG6kYG55LextOJOs+zzzo3gF7SSonV3t1UAsi4KpZvb3uJdY2g7OWab/oNEfuPHq/nfyMXnx0hAAmJkow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxvmHyR/kc6JFGRvJosAQPdPJXSBBjtnI1g5Hj/KEws=;
 b=ZoAnhDjBJTbNwVGnmwyYuReLO2RrvGVYijtVfaFg5FgFS2pzak35WpWAMS4V6zCmCy+VFSOOzUEfOzwjcUTyMMtZCHKbhkkl5x1uSFbrO047Fd8lXwTUG9m7PG+QZDNZ7CsLTLOlpZgz8JsELyGRmhaVer9JA1JCMxFvb2td9nnV7YfQUlSloyw6NSoP4lUMRMJ8v1XMkTckdTOYv/NUyVMUYg5HvYjFJ335qVkuvuHc1d1IOmRYct5sz9xmQXdUmnelW0PoM+9yW55H9PKdgKPXB9NHe+t0tXDCIVdtasinaSOrMWjiJTUfoN1sPQgOi84W5ql3mAmPRyd+Dgon3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxvmHyR/kc6JFGRvJosAQPdPJXSBBjtnI1g5Hj/KEws=;
 b=FvCWpY72ABDpFQg0glTnf9M5C7IHGwioTuTcCLUyFHeA6BAjgMHR03MjEIJg8H+IAB5wnw1c2HwmRifd+QG6uEk9HEISlC1BnqJp0kWmwElDZDXEazhp0eygF6B/V/oNtW2amsmRxkgE/8LvPXsasIb+c3J21i+SnXWqdF4PJQI=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB6142.eurprd05.prod.outlook.com (20.178.127.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.17; Fri, 1 Nov 2019 17:48:28 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2387.028; Fri, 1 Nov 2019
 17:48:28 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Thread-Topic: [PATCH v2 09/15] xen/gntdev: use mmu_range_notifier_insert
Thread-Index: AQHVjcvKV253DVP8r0WB5NYgPgZcBadzahyAgAMzaQA=
Date: Fri, 1 Nov 2019 17:48:27 +0000
Message-ID: <20191101174824.GP22766@mellanox.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-10-jgg@ziepe.ca>
 <0355257f-6a3a-cdcd-d206-aec3df97dded@oracle.com>
In-Reply-To: <0355257f-6a3a-cdcd-d206-aec3df97dded@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN8PR16CA0030.namprd16.prod.outlook.com
 (2603:10b6:408:4c::43) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: afffd79b-5541-4515-1c81-08d75ef3b36e
x-ms-traffictypediagnostic: VI1PR05MB6142:
x-microsoft-antispam-prvs: <VI1PR05MB6142BEADE6CA4E316572CDF1CF620@VI1PR05MB6142.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(189003)(199004)(305945005)(66066001)(1076003)(71200400001)(6436002)(316002)(76176011)(52116002)(14454004)(478600001)(81156014)(6486002)(99286004)(4326008)(81166006)(8936002)(2906002)(8676002)(5660300002)(229853002)(186003)(26005)(54906003)(36756003)(66446008)(66556008)(64756008)(256004)(5024004)(6512007)(7416002)(6916009)(2616005)(476003)(446003)(11346002)(486006)(25786009)(386003)(102836004)(3846002)(66476007)(6506007)(71190400001)(6116002)(86362001)(7736002)(33656002)(6246003)(53546011)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6142;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sWvQLHUb+Zb2MqMU27umQP6TPY+fVpmmlSrKM8hH4imTr1ThxhA8raoNuDVUeuUxvxntgq+OmEuZ+t/7fvl9DVZRKB75KG+Jeu8NSpkVYXGspFpszg7aubns7VxCPp45sZo/s2pmsiIYnOltwEnCaRSFIl3ydCLIpm4K5dhy3UUlDhRlKwyPncZJJ/LJk8JgH6eyYCTUJ7z1mSWDCLqOLZjFO2o4QdtyXsGOvclRAHx1BWuF8QrkPWmbnwYs/wjOAQ5OASWMOcS2JBEr7NhAmOeWjyJ8vvcj/De69djZUrsvoZBiVsifdkAfcvqVg2M8hnNZZl3cM4q9gVss9e/BJS+f8lF3zJBdI3P7cBz1Ht+w+Vydm3jA4kJzvEY5eYXUsLkadiQ0GLTjosKDBmIOXPbwsjRDM4OjinlqfIIEkC6F4YEPStpj3SCDgclJRgs2
x-ms-exchange-transport-forked: True
Content-ID: <2C63294D1F7ACD45826E5FDF1BD65982@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afffd79b-5541-4515-1c81-08d75ef3b36e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 17:48:28.0304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gyKI+02UfkBQHTmFxuAfM6DkrkNGORrCrDW6vdZJ4IdeeO8yWCAvE76jBUBTuwWTulA1i4/hktSr4WPCk2XMvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6142
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:32 +0000
Subject: Re: [Nouveau] [PATCH v2 09/15] xen/gntdev: use
 mmu_range_notifier_insert
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
Cc: Juergen Gross <jgross@suse.com>, David Zhou <David1.Zhou@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Petr Cvek <petrcvekcz@gmail.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Oct 30, 2019 at 12:55:37PM -0400, Boris Ostrovsky wrote:
> On 10/28/19 4:10 PM, Jason Gunthorpe wrote:
> > From: Jason Gunthorpe <jgg@mellanox.com>
> >
> > gntdev simply wants to monitor a specific VMA for any notifier events,
> > this can be done straightforwardly using mmu_range_notifier_insert() over
> > the VMA's VA range.
> >
> > The notifier should be attached until the original VMA is destroyed.
> >
> > It is unclear if any of this is even sane, but at least a lot of duplicate
> > code is removed.
> 
> I didn't have a chance to look at the patch itself yet but as a heads-up
> --- it crashes dom0.

Thanks Boris. I spent a bit of time and got a VM running with a xen
4.9 hypervisor and a kernel with this patch series. It a ubuntu bionic
VM with the distro's xen stuff.

Can you give some guidance how you made it crash? I see the VM
autoloaded gntdev:

Module                  Size  Used by
xen_gntdev             24576  2
xen_evtchn             16384  1
xenfs                  16384  1
xen_privcmd            24576  16 xenfs

And lsof says several xen processes have the chardev open:

xenstored  819                 root   13u      CHR              10,53      0t0      19595 /dev/xen/gntdev
xenconsol  857                 root    8u      CHR              10,53      0t0      19595 /dev/xen/gntdev
xenconsol  857 860             root    8u      CHR              10,53      0t0      19595 /dev/xen/gntdev

But no crashing..

However, I wasn't able to get my usual debug kernel .config to boot
with the xen hypervisor, it crashes on early boot with:

(XEN) Dom0 has maximum 8 VCPUs
(XEN) Scrubbing Free RAM on 1 nodes using 8 CPUs
(XEN) .done.
(XEN) Initial low memory virq threshold set at 0x1000 pages.
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch input to Xen)
(XEN) Freed 468kB init memory
(XEN) d0v0 Unhandled page fault fault/trap [#14, ec=0002]
(XEN) Pagetable walk from fffffbfff0480fbe:
(XEN)  L4[0x1f7] = 0000000000000000 ffffffffffffffff
(XEN) domain_crash_sync called from entry.S: fault at ffff82d080348a06 entry.o#create_bounce_frame+0x135/0x15f
(XEN) Domain 0 (vcpu#0) crashed on cpu#0:
(XEN) ----[ Xen-4.9.2  x86_64  debug=n   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e033:[<ffffffff82b9f731>]
(XEN) RFLAGS: 0000000000000296   EM: 1   CONTEXT: pv guest (d0v0)
(XEN) rax: fffffbfff0480fbe   rbx: 0000000000000000   rcx: 00000000c0000101
(XEN) rdx: 00000000ffffffff   rsi: ffffffff84026000   rdi: ffffffff82cb4a20
(XEN) rbp: ffffffff82407ff8   rsp: ffffffff82407da0   r8:  0000000000000000
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
(XEN) r12: 0000000000000000   r13: 1ffffffff0480fbe   r14: 0000000000000000
(XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 00000000003506e0
(XEN) cr3: 0000000034027000   cr2: fffffbfff0480fbe
(XEN) fsb: 0000000000000000   gsb: ffffffff82b61000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e02b   cs: e033

Which is surely some .config issue, but I didn't figure out what.

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
