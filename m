Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A04FD1CB915
	for <lists+nouveau@lfdr.de>; Fri,  8 May 2020 22:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42686EB63;
	Fri,  8 May 2020 20:40:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5146E0BC;
 Fri,  8 May 2020 20:39:58 +0000 (UTC)
Received: from mail-qt1-f177.google.com ([209.85.160.177]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MSLEm-1ji8AN33MW-00SifD; Fri, 08 May 2020 22:39:55 +0200
Received: by mail-qt1-f177.google.com with SMTP id 4so2569666qtb.4;
 Fri, 08 May 2020 13:39:55 -0700 (PDT)
X-Gm-Message-State: AGi0PubX6qsFFqWT1QXtyA80k8Mdw6sPv1MwzsNgVv1IE8M1llWnPzJs
 AG+6SL7uOID/KMTyBQMJgKrEtLur2KgPjzxXLVg=
X-Google-Smtp-Source: APiQypJqGYAN6piCEtJFLWyr7FP9Ysx6dFxrJEMX6KwbmW3NMEUJg8U7dnBX0X60dDOa7c1uRhBNON+W79cF/bQT4e4=
X-Received: by 2002:ac8:490a:: with SMTP id e10mr2828914qtq.7.1588970394325;
 Fri, 08 May 2020 13:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200508144017.3501418-1-arnd@arndb.de>
 <20200508144017.3501418-2-arnd@arndb.de>
 <20200508150041.GI19158@mellanox.com>
 <CAK8P3a1vCx=XibDdoDqG9obpCFx0JCibAvcKFh6E7_NR_hJ03A@mail.gmail.com>
 <20200508190439.GK19158@mellanox.com>
In-Reply-To: <20200508190439.GK19158@mellanox.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 8 May 2020 22:39:38 +0200
X-Gmail-Original-Message-ID: <CAK8P3a17yDS4EsSbNibYdhXm5qh=hRBqGx6eHH0bq_Wuv_GG0w@mail.gmail.com>
Message-ID: <CAK8P3a17yDS4EsSbNibYdhXm5qh=hRBqGx6eHH0bq_Wuv_GG0w@mail.gmail.com>
To: Jason Gunthorpe <jgg@mellanox.com>
X-Provags-ID: V03:K1:/opjJj7bthq+oquh2wGMOBJE4i/hQpv3mGClc0A/eeZI+7ZVeDa
 j0TsL2n7NSeaaI2iwaaGgSObPSKflc4EztSM5vsYV0GI/Rz5OMnF19l1w1H2IJ5BnCd71iI
 9UserWQcef8JIjo4JciwX0hXtTH2HMNc1CRiu33/2mDV8pchL9RNJIOEkscHGb0MtUvSLxW
 rSd1ErRrlToW4i52pDvbw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:05YBB34LmjE=:Z6MM6MZlS38FqU3gmeSzYq
 k2cYQ/Dyc6w0ht16C5BNtNNy0Y5aagcMvZBbRnk/YsYeZW6nI8SMDuY307NwuKX4Z7m+iIOgz
 48eU2Jg6/2h5slms2GOqsNk7PvKcCJ7EBT9BFEJVlHZUO80xYPDUXBbFgDg4rw5rR6wLdXVaQ
 zZLh7zZSC+Eif8965HzHDc8H+JWTBGkPplrA07XFfHrT/ASFeYof6WGEuAtrkCLWpbh6IxTMF
 GvHL64+84/+pHnqtn6q290abfD3Sy0Pob2zhToaW89Q4D/NqVijnDccYWB/wq/jF5eIUuVl63
 TUm7qEWRa/zPSa5Ao+Fg6gE7DN0p5r5UluJ/s3O/WZekXhjED3BSjSl9fkFAjC59rKSsYjyBF
 0wRj409/NrPo0yUt1+gNK8TGviIIFSS7md5BV8Lhix78sOQhiPf+zAg0We7mlqm4cwtNwiVrm
 67Hq21iX2yJ9mqCEIUvtQpZYArzUcDr8JZdMmj0ZgFHq1RIVhnDhoJ4C/uCi0pVAZNkYRBThd
 ZBvuRt+BIvXKhKbUUf3auL7U/U+hErXTy4Qg3Snp/u+M6GbhIPtHTJavsVJLXCAiJMWwmQ7Df
 xCfNpHzYcWSqAAxVBBBYYwZMYCt0FSmFOxjqVUy0t9ixGns3GhGYDI0KP36M8xS9ArGJQ7Mkm
 SVhul7B2zmspyu5w2dS4p/ykdpp7CEikBqT55MAR4hk8jsrPyYlnyA6l961H2VC1CkDghvhbr
 z0TlmUUYIdg5SXR9ZzIujZcHTB5OZwxlGSYcyXUq+6+po1p42/Pbi3XfGXwyacJgRcvbwC3qf
 sI+oqsyX4ubOzp6yWcHBA3En2gnPZbMUlGJkAZ3d9SF3BNVWcA=
Subject: Re: [Nouveau] [PATCH 2/2] nouveau: fix dependencies for
 DEVICE_PRIVATE
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, ML nouveau <nouveau@lists.freedesktop.org>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, May 8, 2020 at 9:04 PM Jason Gunthorpe <jgg@mellanox.com> wrote:
>
> On Fri, May 08, 2020 at 05:05:03PM +0200, Arnd Bergmann wrote:
> > On Fri, May 8, 2020 at 5:00 PM Jason Gunthorpe <jgg@mellanox.com> wrote:
> > >
> > > On Fri, May 08, 2020 at 04:40:09PM +0200, Arnd Bergmann wrote:
> > > > CONFIG_DEVICE_PRIVATE cannot be selected in configurations
> > > > without ZONE_DEVICE:
> > >
> > > It is kind of unfortunate to lift dependencies from DEVICE_PRIVATE
> > > into the users, is this really how kconfig is supposed to work or is
> > > something else wrong here?
> >
> > Usually the problem is trying to use 'select' for something that can
> > be done with 'depends on'. I have actually no idea what
> > CONFIG_DEVICE_PRIVATE does, as it lacks a help text
> > and is a rather generic term.
>
> It is a sub mode of ZONE_DEVICE, ie DEVICE_PRIVATE turns on a certain
> kind of ZONE_DEVICE page.
>
> Both ZONE_DEVICE and DEVICE_PRIVATE are APIs families drivers use,
> there is no reason for a user to select either of these directly.

Ok, then how about making ZONE_DEVICE a hidden symbol and adding
something like

config ZONE_DEVICE_POSSIBLE
        def_bool y
        depends on MEMORY_HOTPLUG
        depends on MEMORY_HOTREMOVE
        depends on SPARSEMEM_VMEMMAP
        depends on ARCH_HAS_PTE_DEVMAP

then drivers that want it can do

config FOO
        tristate "user visible option"
        depends on ZONE_DEVICE_POSSIBLE
        select ZONE_DEVICE

      Arnd
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
