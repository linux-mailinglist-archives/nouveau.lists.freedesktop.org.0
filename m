Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B272E599D6B
	for <lists+nouveau@lfdr.de>; Fri, 19 Aug 2022 16:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAAD10EEE3;
	Fri, 19 Aug 2022 14:25:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2071.outbound.protection.outlook.com [40.107.102.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4DC10E066
 for <nouveau@lists.freedesktop.org>; Fri, 19 Aug 2022 14:25:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBAwpg6TQEPMaZI+GzIbAXtXPX7wLapVBWJCq58xBiIQHSe04VOGnvULdh6yTU4t8T1XdZBBw3VM/3Jrt3Qh/iPjW9xDyQn78OIGh/7Vegb78FCf++mulss1mI4DIKw9G3ADnb/ake7VJpjjGtnPv9I9f1SJZvJ0H41oMhzI6McPa4mV8VTfxNE1Yy9YrC3L3QvDMQ7sRBnIjDCl0PhGAx1xrVd6jed8K0dsDsIZcM2Ahp3/vxucrnhv5mRJXCZlOU5+Fg5dbCXv5E1cobFUtBjrQNCB1qiLF5liSJAHjyWdeDhxETewf/H0aoac4A44A7Es74Si30UxiPNX484+wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9m1ru5Pu7YcTFvPDs265iRDzQRoE0egCuTHROhKwPV8=;
 b=Y3EzK0YnT0RO28/Ep0oT6IhJsCb3kpHXhO3h8jkI5WFfDVsqGZMYfLPUM0vpLwqjklnC4GWP46zJ0JfqufUQGAqMGtSDEs6IXCL7qLM3rRQG3RFPqyTw1YJdcuqB5Doo/9VEjfVwj5s2KAGCmFl2Scrn8doRoCBWaD/l92qaezS2WZtcvCbtSUn48qTJ7sRvDgjG95YQQj6aptUj0Oj3QxLQWGWMQjPvxG2u3NGbcXuUwXgXRGMTALFMu37g+MbEFL8tZ4B+9CWOsjR9DA22E/+DpSTRMvutW2gf7l9rvOYbS1KAoUdEr8gIW699jkfBlFZ421uf4RYO9KKNM1uefQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9m1ru5Pu7YcTFvPDs265iRDzQRoE0egCuTHROhKwPV8=;
 b=s8LdFYubrY004FXctcB+VZx14Cx/5YF+UWLNq91bUyItuAm8kIwU8w8VnW2k/JtmJMWl04O2qHy+Q0NFTQYf3jYfMDw+7Nl9T/Dg6VOdr7Qnn+84W/OXmTCQRmqBekti5ZVScLTW4jiOA2JnZeazB6MXVFud9BbGtvouWkjLDE0=
Received: from BN0PR04CA0196.namprd04.prod.outlook.com (2603:10b6:408:e9::21)
 by BL0PR12MB4658.namprd12.prod.outlook.com (2603:10b6:207:32::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Fri, 19 Aug
 2022 14:25:23 +0000
Received: from BN8NAM11FT105.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::49) by BN0PR04CA0196.outlook.office365.com
 (2603:10b6:408:e9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.18 via Frontend
 Transport; Fri, 19 Aug 2022 14:25:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT105.mail.protection.outlook.com (10.13.176.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.7 via Frontend Transport; Fri, 19 Aug 2022 14:25:23 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 19 Aug
 2022 09:25:21 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
 <rafael@kernel.org>, Len Brown <lenb@kernel.org>
Date: Fri, 19 Aug 2022 09:25:17 -0500
Message-ID: <20220819142519.5684-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c514d754-c3a3-4dd9-8064-08da81eea75e
X-MS-TrafficTypeDiagnostic: BL0PR12MB4658:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UvjF58R0HD+AMDF+p8p5MYBlo+IeFKrN2kjLslKb9fjoeC+qxAYuZi43RhvfnrolnhtMe0NLgVNP2jPI4WKl02uS9vu8K4m/vg7IQunJt9S9AMcpWl+hkSHU1QeGU/banjv2PVdOTfvCVMq0sjDFLwnz//q0Z1FMAvzifrcni6eLgpsoBbNZ8nsFMkUQvAq0J5C2Tvf1zB6gHMNu+bILZTaz6qAEAN3eLrch1Hb7AdpPiEK/u9B+SUKxWSH/jH40lKJ3mtVMGbviowbvkO49HNukOju2Bpk4kpuAwj4NUeRuXfQ3wuiqXfxRllmfqgJzr+QuCyfo/47nf6eHpRSnK0lN5pYLz/6tNo8+osuwZDVUzfn1S+kiWXU9KDQF9lFAH/20nzzc+0otQlR/QMlOfTEgJKZxgHE69cVjsSGmAt24xND1QoQn8Knt9NNxTY1WBSvLIUiNL5DCVy708iZ45CN9BUEa4Qs+4/P8D9wJdfBI+2H/Q1x7pyyGXcHQO6kHh9xPLAo4yH8Kh+xPHGHYpJg7Y6K3uLoRjDmEoE/URh5vkUWSkHeQPHQb3a3MxjsMZXp8GDkUQV1HgQPQOaE/QqmbOaNnAaA1Mhbgt1qP9jeYLkUqsM2nXcZGVfZi/5q57xwxrXyzcsToRfM3MA+URDP7KI/iioBvGGmCsqlHzdeQdkXSqMLs2XWOW/VwwCUTKRmqUmPXcyAJlEuLKf1Pp+R80srLRcI45RlhjZHXyD1iH7EzKhwdVmp6yT0k9ccKYDSo2JP8UlSX+JrBRb58C6F29ieK74PWJxdxIVCAk+9jlitbKtLRInxoKKEyfPvfdFZ6AXnFBFXwheym0U0T2Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966006)(36840700001)(40470700004)(316002)(81166007)(7416002)(86362001)(966005)(478600001)(5660300002)(40480700001)(8936002)(54906003)(82310400005)(41300700001)(110136005)(356005)(4326008)(8676002)(6666004)(70206006)(70586007)(186003)(336012)(16526019)(1076003)(40460700003)(2906002)(2616005)(36756003)(36860700001)(426003)(7696005)(26005)(44832011)(47076005)(82740400003)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 14:25:23.5909 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c514d754-c3a3-4dd9-8064-08da81eea75e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT105.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4658
Subject: [Nouveau] [RFC 0/2]  Stop the abuse of Linux-* _OSI strings
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
Cc: ddadap@nvidia.com, nouveau@lists.freedesktop.org, hdegoede@redhat.com,
 kai.heng.feng@canonical.com, Mario Limonciello <mario.limonciello@amd.com>,
 Dell.Client.Kernel@dell.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

3 _OSI strings were introduced in recent years that were intended
to workaround very specific problems found on specific systems.

The idea was supposed to be that these quirks were only used on
those systems, but this proved to be a bad assumption.  I've found
at least one system in the wild where the vendor using the _OSI
string doesn't match the _OSI string and the neither does the use.

So this brings a good time to review keeping those strings in the kernel.
There are 3 strings that were introduced:

Linux-Dell-Video
-> Intended for systems with NVIDIA cards that didn't support RTD3
Linux-Lenovo-NV-HDMI-Audio
-> Intended for powering on NVIDIA HDMI device
Linux-HPI-Hybrid-Graphics
-> Intended for changing dGPU output

AFAIK the first string is no longer relevant as nouveau now supports
RTD3.  If that's wrong, this can be changed for the series.

The second two strings appear to be non-scalable workarounds.  For
accomplishing these tasks, registers can be written from kernel drivers
or custom ASL can be put behind a _DSM.  By forcing either of these two
solutions it will better let the Linux kernel control the behavior.

Based on the above this series drops the first string and marks the second
two strings to only apply to older systems.

Link: https://lore.kernel.org/all/54add026bb6f45fd94a2dc2bae4adf9f@AUSX13MPC101.AMER.DELL.COM/T/

Mario Limonciello (2):
  ACPI: OSI: Remove Linux-Dell-Video _OSI string
  ACPI: OSI: Deprecate some abused _OSI strings

 Documentation/firmware-guide/acpi/osi.rst | 24 ++++++++----------
 drivers/acpi/osi.c                        | 31 ++++++++++++-----------
 2 files changed, 26 insertions(+), 29 deletions(-)

-- 
2.34.1

