Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B752093EA1C
	for <lists+nouveau@lfdr.de>; Mon, 29 Jul 2024 01:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D1810E00E;
	Sun, 28 Jul 2024 23:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="W4FEjUeR";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C4910E00E
 for <nouveau@lists.freedesktop.org>; Sun, 28 Jul 2024 23:04:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWCTaTl/tutm2yzvFsVOagKfgLtCENP2v9T54TgmxA3NWaFr6kKMH6pMXn07G4/9dz0OkuZCxnYZ+rHh5BCprlSrM37YNb40Yp/4dCggju6jwoFg6HFtZlbzXKHthqeg8QZWl2Ukz95tNmJ3olev01fV+jymqyBmyItIegpyBR+OmACMjGsX9oSTA1oyxjrfnaLbPLd7gyWdMGutk7LYdDpaq3qsUHQtpm+WUPJWPngf2Lz8IRytQJCp6kJXIEEYizKn/GSVdQXM/wlQU6OCyJ2A5mQu3rnsp1USfHu2/Nuf8a0WJWmXSG4cSNPa9vy+sjCUIUNmBv/WzhvsBQkXUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6OSHo4gbPZk0lpW616leDC7VRI4yRI+VoAHukrE608=;
 b=mQGVfLnRZC2lMj+1xVaN0vK4nlHokR/TuuVooO75RTdLQqhGwHXHcubthOQE8UX+SRQT/y2vOZKJg1oBrU5PTXXJHRs352B0rJPEsWp6ljLB/wPtxzn8nYhuKS7iAAty5RaR0JOYAL32CZP2OLpArseStJxocYCLZuV1jMrlSUs9OO8FNGo8Ik8Fj1e/rbb6v1n+IfYWtuF4ZnT0RRDdaLflc0/1RVcNGYgt9Um1wEjfoFOfHH+CJEC3w3c+UXq7blkpD6jmsgVjwCWbu6sClY33UFxWf2niJJOYqhy/PW6EhzkBQMqW4p22RyuwCepHe4uz9R6XK5ng++clL7zm1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6OSHo4gbPZk0lpW616leDC7VRI4yRI+VoAHukrE608=;
 b=W4FEjUeRzHrCP9QdX3m6SGpPpjWYElO97QyPBrzgT/JYLxRv2iNp1UY7Hqz7GqdM+uMb2lPzfEx4hbbZ8sf0K0sSkrARgsWf7t88Impg+jh9e43pVU/GrWaibVzkXvuwJ7dlnKvQAI8Vky/R1T21pux5pCV7ORVJw2FhwvZJdtMmHNk+0UjAMrriVOvTNBb5PMdEtoqDCPmK+/oPkAgoNG3slsmKfNlMthpqdGpX7p5mK4glwzheEcKxQH+g8MB1mPIEIDyCwWBAhp9ueLGDs9bXPRFuf30AR+OxmGBPCTiIMtbLIreMgv2WBLuJli2kh3OMhf/5j3jJRJSOmWvowg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by IA0PR12MB8696.namprd12.prod.outlook.com (2603:10b6:208:48f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.23; Sun, 28 Jul
 2024 23:04:53 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e%4]) with mapi id 15.20.7807.026; Sun, 28 Jul 2024
 23:04:53 +0000
Date: Sun, 28 Jul 2024 20:04:52 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: Ben Skeggs <bskeggs@nvidia.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 02/37] drm/nouveau: handle pci/tegra drm_dev_{alloc,
 register} from common code
Message-ID: <20240728230452.GZ3371438@nvidia.com>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-3-bskeggs@nvidia.com>
 <Zo1UP-aapSyf2Rnj@pollux>
 <e67e0c36-5c21-4f37-b489-78ec45298c4e@nvidia.com>
 <ZppJuiWfgfkEKeCH@pollux>
 <9760d7df-dfbf-478e-9b0e-ddc7768b8de1@nvidia.com>
 <ZqPDkZ2t5MjXX4Sx@cassiopeiae>
 <a6b13446-d903-4a94-9afc-ce04b41d5dbf@nvidia.com>
 <20240728181308.GA3043865@nvidia.com>
 <Zqa5VovShzF1lGC2@pollux.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zqa5VovShzF1lGC2@pollux.localdomain>
X-ClientProxiedBy: BL1PR13CA0082.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::27) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|IA0PR12MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: ef109fe4-2517-486a-0c09-08dcaf59b0bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?re0cM67uzA/kuJHyPDsTXFq9YtUMLCLG44hKUKR33A6xFVRKmpQD+OGgvF/t?=
 =?us-ascii?Q?ZMWeZTb3yGRv5d3yPGEPFItglOvlv8uJtFousl7HPdMzpmKryBMsGwAkS/9o?=
 =?us-ascii?Q?60v7zUc+qpZd7sN7hsBglix8a/l73pVK5vmCCINYaI9xjYr0NsVvgjxLoCKT?=
 =?us-ascii?Q?eSPpVD3y4BzK/GjzOakYbLSy8bws/0ZtffbUk6i0LdseTZ5c3xcCOcQyrnSj?=
 =?us-ascii?Q?IqgEjOYwmmaWeP2BVLgbITjC3e9nDi67E4fmI0dlojwymbl5jTCOBG4mveK2?=
 =?us-ascii?Q?T3Ux/ZLcktuTaSItj6pSjHLqVmBn65IvYYC9bT/3phvCakXj9u7PNVwIDeKC?=
 =?us-ascii?Q?motH0Afpk4PYVIOtB7B5Gxa047pvPMpy0fY007J1J3ZQaupwvq96E9kj9qdX?=
 =?us-ascii?Q?kg25XxDBAt8S/MjohKvdnxpHO346CQHPC/ee6XADFkZbNLk5dOLjNZxScPOg?=
 =?us-ascii?Q?Jwi+nebbVjXmtfyvJApzQnQj9e9cwoyx2vVjcytsDc6C60PNNDPyTij6mCEu?=
 =?us-ascii?Q?ECX/1ebB9b1SGBjhSFS+MLCjpgEk6/USU7vFnh4jqoP2Jp9ZMKMF3ORa0aoi?=
 =?us-ascii?Q?rdcRDRuGhe0mhqv19/HzAIPyDs+/J8RzHO3rTC5tjrf5vJVT1BGdwYl4Nyvp?=
 =?us-ascii?Q?yEY+/p6egeTtMEravjdSHN4tQxYNr+C3kr5W2DzyPOBgkQrZXfYscAoQy1AI?=
 =?us-ascii?Q?BBiuHSCdecN7xseMVoDPHhVDItNvkCruD2K0zOU6jKCbgV9aIgLIcDZbRf1u?=
 =?us-ascii?Q?wMSK2rUwpC84JwX6PocbIfLnvbDxEHlZnxoj4LAVwTK4OxsKTgnyNjeDvM7Y?=
 =?us-ascii?Q?W6fsziN4fKY/e9gmcDXYfRavt2HyRh42sl7lTA3NGSdF8B42bUy8s0++mAuF?=
 =?us-ascii?Q?9+EIbJfeGpYjWatRJ0FXsxUbS1v7k+YI06p+CFyLKeKoKVbOdiYIOZ7PHyUa?=
 =?us-ascii?Q?f+phsCXC1x1j7HTn9KzfjPyw+wv9jlSFudAzFeihuthpBkUFHNn78uNj5Yz5?=
 =?us-ascii?Q?fQzU2JDMLyNE/b3YcZ9tGtM+MC5VXCwFo2CAyii7SwzaGeH8h3MAc7fw9RVc?=
 =?us-ascii?Q?QtN5Uh+6pyV6QT387nti7gl/IxR6+4ux8sDjbwLRRHrnlBSx7ji+Sx7Bt+k4?=
 =?us-ascii?Q?mxAMx1Ceplmdw+cF+VBsutEbF1gVOPyHlVWHnvilNLfbR5K9T5q5hXUj+341?=
 =?us-ascii?Q?Qk0PyBoO4yROjgn8IhFBrf2xrxtc9nNNxtLU1qho81zp6SGUrAjSOUKnsd8r?=
 =?us-ascii?Q?c62Ktc0QBBgmi9lO3BaaB8Al4HQ6kTDzy2evnAzwYw9ZVuRSerVv3c6nj9r/?=
 =?us-ascii?Q?uGc+KIK7tB8Rh3jo1hDt0KrrxP6XZEITHYPN0uDVfW0Owg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5+42FNMewbrZtBKMA4pkJbPlaiu85TaCQfv/YNpzyxhRGhO9AgX08ebOKPTx?=
 =?us-ascii?Q?yyNJYcjng8g31U1xqz8enqT+9sFPhTiTTrfvSLsDHl2c3kmLjyRuznPCKreZ?=
 =?us-ascii?Q?qPOlmukjQ2Yu7xIJxrnJPhUKX8UsinHy/pgAY37X0KkvAffZW/lKkxCTROzN?=
 =?us-ascii?Q?U7dZYRNzcdDdzyqZeGj+YUvmg0qf059vSXCf2afsRDsXBg5SwbVMigPgP6iy?=
 =?us-ascii?Q?n6uwGa6dmV/m5AssAhHphplEC5wk1tSTC91OUQSSdONExm30W3oVelNDT6Wv?=
 =?us-ascii?Q?QXSuKEqkC+KM+wlqg+ivTcojF4p05dk2ohAOulK3ZlsbOGwPVgG8kDuaUO4i?=
 =?us-ascii?Q?bTn9yws55kN7WbKknel9hNMQVOSeeec7VhIb0g29FoA7im08EYntB1QE/Sli?=
 =?us-ascii?Q?gcogQKFLYiwtxcQg0lRsaElMTduP7rCCZml2+4ugzCw7MRffrrdGs9D9cGYm?=
 =?us-ascii?Q?cw31wnaiUQlryQ5epQ7S9sHdtZbvO78kxRuTbVAK2tDILDefCER2SRTxZGSE?=
 =?us-ascii?Q?wZjCv1yXSAlC5PXvbK/qhViZHpf7Nib7VWieuUl95B87ibFD+fHt0XEaZED+?=
 =?us-ascii?Q?ll60fNFpUVbJVJwHoEND0AfkhxpBK8TnPw782hJ0pEUb9xSt6fj5u28G6Yi6?=
 =?us-ascii?Q?xsqAuu4ci9feUsBJYw0d4rjxKNkIWRj6GPufijieIqjTv3a5hSnwuxSdShtx?=
 =?us-ascii?Q?VzUed/se8xMgXV2LWOOylxu3HcmkSipmAJIGqTtzUZmhXTo0hpWO5CAXzYic?=
 =?us-ascii?Q?9xccY11zNQeynMK24QIihkVpAOdO7vRt3P78bycAgJ4f9HYDhp7UyuxtqrXs?=
 =?us-ascii?Q?MJ65rnuBadhpw+74QDWWB+HD1+tpV6+UKTkXnMAxc6pn7jMY06qnq6FIb791?=
 =?us-ascii?Q?lAn88/KDE+H+A1a2EGm43pBdYp49Ap44uf8cIb+lGoPR2cMrWkhB5j33NZWw?=
 =?us-ascii?Q?rmVT9o54P/gV4g4m6WL9d2SPwqI9aRxss4xZkWnYUiMj8w2AXrZ+SCsQ7gMk?=
 =?us-ascii?Q?oyl+mSRJJBR2FCAXkjubiIUCOIh1tZS7ErMI7jpCUD24WYfU9FhcWGK4oV7U?=
 =?us-ascii?Q?PfAYlxunGV0CZMuoplzDVM7kWPMHvd9yT5TTK17+SL/qA1gLfDa41xaJQnX0?=
 =?us-ascii?Q?wwEp0IJW/cQ7dLRRWHbA0/Su4cD6Wu4FYzZ25X8hKmwtgit8XJuau+c9Z3c4?=
 =?us-ascii?Q?u5sHvGuPIhYlxo5ZMBF3SQcgHIN4DIgXufo8tKCBBxEP7Gw/n50MO1G6NrAZ?=
 =?us-ascii?Q?nbr5cbEzdXcDiKHImr/Iz0C9KOSzGh1aAVj6/E1NnxLi8J67XQKmeAhO3Q+G?=
 =?us-ascii?Q?9xXp2D/J9Op0ZsFWz4ChS0+gsCIcXEJhgU9YcMSLbasvYE9q9ZhF+rSHY/5N?=
 =?us-ascii?Q?vj44Cip1pspd92Su8fFmgkIdFbdnqCqIUO5Zh610JIS9T9g6PfTk5dlbMiZh?=
 =?us-ascii?Q?vFmmaE9w8PvLsmnFJBXrcZbsIend3kpRu9pnHVjCXSa/f8xwoS8Ki/ZTQ7WM?=
 =?us-ascii?Q?QjneZFIieVLTIDfqAFm/16B9emgDYKzvqJUy5rZh12Shd0NUUta3zxBzaXfN?=
 =?us-ascii?Q?Abdbm8VMs6E0RPW/BCs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef109fe4-2517-486a-0c09-08dcaf59b0bc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2024 23:04:53.2858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+V0D7GUpYsDIVXNQVzZYMIgVGG/TZuNBppBdXJNOu3fc0BBFlYJNYxVW92oyE6g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8696
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sun, Jul 28, 2024 at 11:34:14PM +0200, Danilo Krummrich wrote:
> On Sun, Jul 28, 2024 at 03:13:08PM -0300, Jason Gunthorpe wrote:

> I think we're on the same page with all that. As clarified in [1], that's not a
> big concern, I was referring to the changes required to integrate the auxbus
> stuff.

Well, I see this thread having the realization that things are not
setup proeprly to use devres. To be fair devres creates almost as many
bugs as it solves :\ cleanup.h is possibly a better option for most
simple things and harder to misuse...

> > normal (though most subsystems would call that unregister, not put)
> 
> A DRM device is reference counted and can out-live the driver, hence the
> drm_dev_put() call in .remove(). There is also a special drm_dev_unplug()
> function, which does not only unregister the DRM device, but also sets a guard
> to be able prevent HW accesses after the HW is accessible anymore.

Every subsystem has a refcounted object, struct device is inherently
refcounted. You call the thing driver calls during .remove()
'unregister' because it is special. Once it returns the subsystem has
to promise no more code is running in driver callbacks and the driver
is permitted to start destroying anything it might need to use when
processing any callbacks.

This is really tricky and people routinely misunderstand the
requirements and get this wrong. The consequence is UAF problems in
obscure cases with unbind races (that few actually care about), but
getting it right starts with labeling things properly :)

We went through this long ago in RDMA because someone actually had a
usecase of live driver unbind, making that work reliably under a full
active work load took some thoughtfulness.

Jason
